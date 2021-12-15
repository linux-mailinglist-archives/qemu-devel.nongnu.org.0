Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D534D4758FB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:40:50 +0100 (CET)
Received: from localhost ([::1]:41502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTaR-0001NI-Mi
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxTUk-0007jq-Ct
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:34:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxTUh-0004JN-Q4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639571690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzrW5YWieGPjRsTTAEQgxBCEkzE5ueDw06+CDf9fJ8c=;
 b=Rcj8LfiCz8bNLoXSicx5bmZi5EJ8zqh/INbQleaSaHJ9NBrG6pcvSOYmFkEjGEdQSXQEO/
 qojKvTmZhbAxIyyoKYwrufS2fhZyOuFRstl4J3HP3VnIcP/bmiKZBv2VpUbw7Au5OaGCSa
 9vKsZ+wMiPpClCyIOaeToocD3b09eUY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-cO9vrWt0NyaTtag1O9vDLg-1; Wed, 15 Dec 2021 07:34:49 -0500
X-MC-Unique: cO9vrWt0NyaTtag1O9vDLg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m12-20020adff38c000000b001a0cb286eacso1643632wro.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XzrW5YWieGPjRsTTAEQgxBCEkzE5ueDw06+CDf9fJ8c=;
 b=SCeusbs5bdwfpIo9A5tMAMZxrJKjPopzMLX/oLURiqBnoRABqmo90YQPfSBs7FPKrJ
 MWO0G9E+jfJDseuekw1n2Tme9pGaz7h6vqy4Q0F2RCQsFiRcDpkwzPrx+o+RiC38i3g7
 trPuK2NxydQq5sKaCZigSNvHFz44nPiYUNFUJA0FGNmk41GEgERJEekJDQIJaKQmxJwS
 m+O/5PY24wgOdzsuQB1UAYG4LeJVp4os0yd/N63/Of9hMPqRjjUduP/cMrNkWhy8n0hl
 dmOUIY5n3YBAU/Unxb0i+p72gucm+wYyNsMQNwS6PNrIiIZyjP6snz2kC4VFpl2g12kh
 qgeg==
X-Gm-Message-State: AOAM533UKANtbKDUIC7EqElHFimrS+8Oy2QKbXvhkpMd6M/AjuYVwi1v
 k6UXfInacxBTwfxCPOAlMgy9lw3PtywcWpNtBPfwGbNf0wcoUPGeSSDUsolwxllJUa3fK0csTdK
 zpf9baYu9FuGYKzA=
X-Received: by 2002:a1c:4406:: with SMTP id r6mr4508261wma.42.1639571688220;
 Wed, 15 Dec 2021 04:34:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzHDaodPqWKPgL3p1of1A0Um801pWvYXc+1nYs4m9ce3g65g8q+yUkSQ2550Wf8Zighna3TA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr4508247wma.42.1639571688043;
 Wed, 15 Dec 2021 04:34:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n2sm4858562wmi.36.2021.12.15.04.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 04:34:47 -0800 (PST)
Message-ID: <3b8029b1-8c24-4495-4433-a4dd19d3b28b@redhat.com>
Date: Wed, 15 Dec 2021 13:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211213104014.69858-1-eesposit@redhat.com>
 <YbdeS/q3L1mBmEyT@stefanha-x1.localdomain>
 <5fe9120f-04d7-0cfa-36b0-33c9f1680809@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <5fe9120f-04d7-0cfa-36b0-33c9f1680809@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.12.21 19:10, Emanuele Giuseppe Esposito wrote:
>
>
> On 13/12/2021 15:52, Stefan Hajnoczi wrote:
>> Off-topic: I don't understand the difference between the effects of
>> bdrv_drained_begin() and bdrv_subtree_drained_begin(). Both call
>> aio_disable_external(aio_context) and aio_poll(). bdrv_drained_begin()
>> only polls parents and itself, while bdrv_subtree_drained_begin() also
>> polls children. But why does that distinction matter? I wouldn't know
>> when to use one over the other.
>
> Good point. Now I am wondering the same, so it would be great if 
> anyone could clarify it.

As far as I understand, bdrv_drained_begin() is used to drain and stop 
requests on a single BDS, whereas bdrv_subtree_drained_begin() drains 
the BDS and all of its children.  So when you don’t care about lingering 
requests in child nodes, then bdrv_drained_begin() suffices.

Hanna


