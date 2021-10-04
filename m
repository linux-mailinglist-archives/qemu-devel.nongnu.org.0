Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB702420692
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:23:02 +0200 (CEST)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIJQ-0000cZ-CG
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXIHl-0007IV-94
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXIHh-0003oi-QX
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633332072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9K8OTMY03m8Iu5Te9RkzF+98t7fPX2UHOA1snMUmnc=;
 b=AtBvcQttlx8Tz+wYxKXxZfz2o6o3GrGqhamAuz7Dw1pyQJtciHWSWl9eAo3sr7bP2bXaiH
 2V3DYCyA+O1yZnffmCYShZ/Y7vsX5CiJDBbK5E7aZLqeTV+HkBtIiHABb/7Qp7wXMtDaV1
 YBKzIB8yHh2vYj4174AeDdetxAM+9zk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-W58t0h0fNdCmawLBX8pGzA-1; Mon, 04 Oct 2021 03:21:10 -0400
X-MC-Unique: W58t0h0fNdCmawLBX8pGzA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so673132wrd.8
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 00:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p9K8OTMY03m8Iu5Te9RkzF+98t7fPX2UHOA1snMUmnc=;
 b=nFz5cpy8ofoT7Bl6WfKv1L8S16lJ6635FuP5YRw1Eox/6y+7IaNJ6A+ktUMjBfVj6s
 TK5OufzXnEqcxsgEuJg+5Kjim/+YBTBeg+U9S2N9rVH9m8EGd+8ytVqmXMIdR8d6bmyz
 xTP8ObmdjP/pAX1eeujZppseFKVmKFmwPNDtCe61vax/VTeX4zHvw9BvTC8+9+lYkTjJ
 JI5rTxHT6i/kGzTuBE+WcpzcCQZVQuAWQ+RpPG1BOeObuBTMDRVeTziFT7gKdEQF7dmH
 s0tvkTd1H2BTM0mvYk8c2bjaQjcm6X3VRHnELrIrxJQC0HaadhaIJl4Baunl1v66muNl
 go7w==
X-Gm-Message-State: AOAM530/zbxfw5gvBmak92SHNy+j938yNhUPEf9tlBPXfYfzC6QOaBSm
 bxZRJRxiilBspgUqEExFzfk2tFaAuEgRFJ8blqZdqmQtSbyZdGG1boDzUVGmWcTAouVJrtcsDLz
 ZovsaY1TwwaBsiHc=
X-Received: by 2002:a1c:411:: with SMTP id 17mr4000385wme.158.1633332069566;
 Mon, 04 Oct 2021 00:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTHhlvN55PINCcBQgZNJcKpHPhFlRRyiFgBG6ZgXNt91WbKUAj+72nIw7Z4Hd0GeykM8wNdw==
X-Received: by 2002:a1c:411:: with SMTP id 17mr4000365wme.158.1633332069373;
 Mon, 04 Oct 2021 00:21:09 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y15sm6866060wrp.44.2021.10.04.00.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:21:08 -0700 (PDT)
Message-ID: <b9bf79a0-1b5c-ac12-2450-7058b3fc1c5d@redhat.com>
Date: Mon, 4 Oct 2021 09:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] docs: build-system: rename "default-configs" to "configs"
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20211004071203.2092017-1-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211004071203.2092017-1-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, alex.bennee@linaro.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 09:12, Kashyap Chamarthy wrote:
> Commit 812b31d3f9 (configs: rename default-configs to configs and
> reorganise, 2021-07-07) did the rename.
> 
> Reflect that update also in the documentation.
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/build-system.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


