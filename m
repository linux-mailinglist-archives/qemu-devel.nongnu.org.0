Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3E4CD257
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:25:05 +0100 (CET)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ57Q-0006pg-K7
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ53T-0004Vi-2U
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQ53R-00023h-6w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646389256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hvRIATdrZDjs90oj77Chb+AnjPdCKJGRn7pvSG3qkc=;
 b=N5vFxssqmWHScOsqnjgTpc9Hv/7zsxdwciMjh+uz4b+E4dTfaa4Liu7tWv4iGl9oAI33VW
 wo82YL16EjqKolgTM39VT0OCLCfSPjx16FVchktqCnC+OoHxTa/FovHXj9Xq+IEEGHNI0N
 d0ljP7Di5id2uUso0Y5Hpi5QB9raQ+8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-ZNhK7whwO2KpL2DFFMJDbw-1; Fri, 04 Mar 2022 05:20:55 -0500
X-MC-Unique: ZNhK7whwO2KpL2DFFMJDbw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso4179196ejc.22
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5hvRIATdrZDjs90oj77Chb+AnjPdCKJGRn7pvSG3qkc=;
 b=IQ2okjemnsRsOyLkJf0gSwXntb6c04gob/g/ukAIF2ySNtZfX8U6qb7JQpc/Jxnbd3
 kQvF8kq2ohBiIS1XIa5xlokF/41xFn3aQm0hh9wROYpTdfQTyEVY3LeiaIvMBWndsa/C
 5vsHeGcJBfyZimC1oUUcdznGiBOzm+824kaIKzwC5Z15aS5qipSVfYKHU5cNdDl1Ttuf
 d/NKX01rd1rIZdknclJ/XVTTxxOU9Z5sbiVDPLPSYfy4U2NI+j6JZg0IBbmmlTseSlKc
 6Da8UhRDJWP7L+4IKcPHdtJiYGx/rebqp8quFRKdwvp8xOf0sAmFVR78JW49wGj3Db/t
 XI1Q==
X-Gm-Message-State: AOAM5310rRV8yVJ1yQ106tDIdoPewkdYVdFcoqDIAh+od/miTosPxNWd
 /sbtJ8zJX2umX+rnKcSeFdKpzfuqH4aUtBu8ayMqiuCF0K532uQyNZWwLwMqs4AHc2geJvJgGR4
 yDSWYuJ5am7MJekw=
X-Received: by 2002:a17:906:1e42:b0:6d6:df12:7f8d with SMTP id
 i2-20020a1709061e4200b006d6df127f8dmr16128251ejj.15.1646389254267; 
 Fri, 04 Mar 2022 02:20:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX1qdJKFJtgUyFCAQf8peUF/ttWvKc+CcZUcGwacVPIQ3KTpuLH0hVrlrBPGnL113TZY9w3g==
X-Received: by 2002:a17:906:1e42:b0:6d6:df12:7f8d with SMTP id
 i2-20020a1709061e4200b006d6df127f8dmr16128239ejj.15.1646389254027; 
 Fri, 04 Mar 2022 02:20:54 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm1627319ejd.11.2022.03.04.02.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 02:20:53 -0800 (PST)
Message-ID: <4e6fdc26-50ab-2ca2-3a4c-e176955833d1@redhat.com>
Date: Fri, 4 Mar 2022 11:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/16] Make image fleecing more usable
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.22 20:43, Vladimir Sementsov-Ogievskiy wrote:
> v6:
> 11: add comment
> 15: limit to qcow2 with unsupported compat
>      fix style
> 16: fix style
>      change log('Backup finished ...') to assertion and comment

Thanks a lot!

Applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block


