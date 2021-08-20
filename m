Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0213F2DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:13:00 +0200 (CEST)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5GV-0008Dh-Tn
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH5Df-0006Ed-JA
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH5Dd-0003tr-4u
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629468600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQT9ONiHLk7yAa0p4Nj0sMa/6pcEWW5lpPdVTij6UtQ=;
 b=c7ei18ySLAfbXsYYlIKFgTsL3iuTJ2ZeLjQG1HSPgSj6ddDJOXrezLrnnS8dbqOrjg998Z
 KzTG8Pt0uXryi8qaZa1O2BpAvdY9OmKSktlpo85o01cFxFpP8ccyLj6h+po6mn3JFozhx6
 MbRGAEaIVyGfy8wuqVafaqy23RdJMXE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-tWydL36gNCeowc9-Cs9OCA-1; Fri, 20 Aug 2021 10:09:59 -0400
X-MC-Unique: tWydL36gNCeowc9-Cs9OCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p2-20020a05600c358200b002e6dc6adcecso2909096wmq.0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQT9ONiHLk7yAa0p4Nj0sMa/6pcEWW5lpPdVTij6UtQ=;
 b=PCVIJcdx12+jxOO+9K5s3qJBgLfV+Gvr6YyK3kJdN2mkIWl7yFAMAqeVzr9v81xpph
 i4FlYj2BMC/dkpxNm5XKk0dAQ0WU0NlzwYgJ0biHvXFw3dsgqImRjRONTa6j7PDOWQqT
 CQI/hIjg2O6PFVXUzkEyBgsFz//9hfvlc+hGYeqSkHeBWosGPuGemekZbFsXRhAVtaHN
 i1KRElTa/B7goC8YtHFANfP38aD6XP6Hftqg4rWcxRb18iKE091Oyuy5z7PrnK4gGhCL
 RRRvPdYrXVrLX0JCb4+myU6XULhq9F/ov5Yw1Bf4EbMMDFf+9yNNmyFzEeEh8uG0AI7w
 SYGQ==
X-Gm-Message-State: AOAM531XkRLm2PhciOx9CKon2NmZhJHysHK+FPld+fhSZGRtuPg0bsuw
 UFYxIpDxqAReO1gdu00niYwHZ/n2hRBmzssFbGHJLGY06/cMV4qOI04cBVjtKJ5ZQwJ/lF8oicI
 8O2xVzk+4eCThX+o=
X-Received: by 2002:a1c:7904:: with SMTP id l4mr4240444wme.42.1629468598012;
 Fri, 20 Aug 2021 07:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6T90jMdObTgYNP/soCYc6Mw9aCu4AshkGpExi/3Hnf0WzpY49iXSBDAggZOP7T2F2HwJADg==
X-Received: by 2002:a1c:7904:: with SMTP id l4mr4240413wme.42.1629468597800;
 Fri, 20 Aug 2021 07:09:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w14sm5951136wrt.23.2021.08.20.07.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 07:09:57 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones"
 <rjones@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
Date: Fri, 20 Aug 2021 16:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On 8/20/21 4:04 PM, Bin Meng wrote:
> Hi,
> 
> The following command used to work on QEMU 4.2.0, but is now broken
> with QEMU head.
> 
> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> allocate memory
> 
> Any ideas?

Richard hit that recently too.

Can you provide:

cat /proc/sys/vm/overcommit_kbytes
cat /proc/sys/vm/overcommit_memory
cat /proc/sys/vm/overcommit_ratio

and

cat /proc/meminfo

(CommitLimit, Committed_AS)

and OOM messages.

Per David, 'you can trick QEMU in trying to work around
that issue, specifying a memory-backend-ram with "reserve=off"
as guest RAM.'


