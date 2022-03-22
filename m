Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26CB4E3BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:52:51 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbC6-0005NX-TI
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:52:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWbA9-00034x-Au
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWbA6-0002kr-TY
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VSV14mJ8XqlEKX53w5CnZV5Mu43YvqF896c5D31SBo=;
 b=Zx0TeYmJGqkthulatQRa2/bNwaK4qHV4I3+qAJ5mCXnebsMcsH6FoT6ZC3Nr8rDhFB56eO
 VXX30jPJUNLsAUTS2zM/uvoSRnX8ZiL2hsk325BniDAQsJUAM3LijKIrcWUqTLBONyz73O
 hfpPzmmOZF4d3MHIaLDaYya1NroYClc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-hESD5PcFNPWjYkmx3opAWw-1; Tue, 22 Mar 2022 05:50:45 -0400
X-MC-Unique: hESD5PcFNPWjYkmx3opAWw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d28-20020a50f69c000000b00419125c67f4so6000472edn.17
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7VSV14mJ8XqlEKX53w5CnZV5Mu43YvqF896c5D31SBo=;
 b=0o8Rr0aM1RTcVtWQfvrBLvVvUCr1rqKerqr/YwddN91QlyJ6mNEgSOduIVQe3gYsHe
 1V8WcsigLQt7yEcHN/5n6LMqBQx15MkurlJMaeIh/x4CtKySJ6Xc66MTuK4wAVkb0m1L
 Hcl38cYx3ZI27Lw6SgQJReyERC2Vw7Nwp84blqA+xjVGIE/vN1LQl0Rf036BNrENMc7o
 HhOAoTiR7Q7vdo2xx8ZmGrSkBroE2jJOlxavo0M4tGC+jwCKO31wwt7cOJDV0iiswUfh
 v4s1uze1avPkbcJ7+LowY3rvypBL5IRaXu7RF/uGpKHkrROoYdu1xR+4BINamUlppuGq
 zASg==
X-Gm-Message-State: AOAM532p6b3luXl1VCySG3W4up4LDZdzytuUlIzv2vQ1ksP93J7HWs9p
 odHpav4kCiuhRbX1esukcqpMTqtt2flRDhZD5LdwB68HT/ubypcfDrAl74AsENikv4ydtXPKC31
 EzogV/hAahWXc7oo=
X-Received: by 2002:a50:f19a:0:b0:418:f94c:fc24 with SMTP id
 x26-20020a50f19a000000b00418f94cfc24mr25701467edl.34.1647942644214; 
 Tue, 22 Mar 2022 02:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu2NvzIBOv4mHJzXxLoZTREwlPZSaSyPf2lYkhGTKHZCSYHuOlI060eSpxD3C1yDikPg+9pw==
X-Received: by 2002:a50:f19a:0:b0:418:f94c:fc24 with SMTP id
 x26-20020a50f19a000000b00418f94cfc24mr25701446edl.34.1647942644025; 
 Tue, 22 Mar 2022 02:50:44 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm9489551edz.35.2022.03.22.02.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:50:43 -0700 (PDT)
Message-ID: <c3ea89af-850f-7b37-2bac-26efa1776200@redhat.com>
Date: Tue, 22 Mar 2022 10:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] iotests/207: Filter host fingerprint
To: qemu-block@nongnu.org
References: <20220318125304.66131-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318125304.66131-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 13:53, Hanna Reitz wrote:
> Hi,
>
> Commit e3296cc796aeaf (“block: print the server key type and fingerprint
> on failure”) improved the verbosity of our ssh block driver's error
> messages for fingerprint mismatches.  However, iotest 207, which tests
> such errors, has not been adjusted accordingly.
>
> Since the fingerprint will differ between hosts, we need to filter it
> (and can’t just statically adjust the reference output).  The problem is
> that the error condition is printed by iotest.py’s VM.run_job(), so we
> need to pass the filter to that function.  Right now, VM.run_job()
> doesn’t support any filters, though, so patch 1 adds a filter parameter
> and makes VM.run_job() use it.
>
> Patch 2 then has the fix for iotest 207.

Thanks for the review, applied to my block branch.

Hanna


