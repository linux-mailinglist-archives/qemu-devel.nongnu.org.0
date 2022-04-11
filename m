Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F94FB401
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 08:51:38 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndntg-0001Wv-Rp
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 02:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndnnn-0006xr-Sa
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ndnnk-000559-BG
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649659526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh5GAwcYXC/VyU+NtQUXI3vaiD4avmeoaF7sOhHKVv4=;
 b=De6VqY0IbTMxApGItUCSmR4lsrgtNHtft8wiwBbLQCBdKH2NxY3KMwbT58iGzJtrF1XkaB
 7Whn1u82J/dUGb4g9ME1ZtP3661eOgIC4TclXjVjVIwh2f79raLY5F4LKqanYx1oJuEuUY
 U2mtRTp/ccDdRzAqC1DhAfIsWIAaY6k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-wCJdPJjvOUyKM3NYD1kF9A-1; Mon, 11 Apr 2022 02:45:25 -0400
X-MC-Unique: wCJdPJjvOUyKM3NYD1kF9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 a16-20020a05600c349000b0038e6392a346so8294123wmq.4
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 23:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nh5GAwcYXC/VyU+NtQUXI3vaiD4avmeoaF7sOhHKVv4=;
 b=HKmKeKsiJDmv3K0OGpB7y4NyWkfDawZabaqP+x1FlIHMSC1PMAmKIQ6b4+FjnhslNW
 D8ZZQ3g/brrClFmR+dVK2n76ANYtGThhSnfKbaH/M5MqN5MhxY5Pvbj25llOvk6CVwZS
 FDbAPCiNvNRO0ISRDgGfzj4hLZUzvOOt4kRE0Gc6kNy3PkASOILOnx2yrAzcvkH3VfsC
 Kw18tIVYrE8MuoAFmb1PqulosH/EzcKic19oeqanQv842zBUAcPoYJHSZLMtNsjUeACE
 EXegX0A/3GxZsvabIEEm9DMunG9XvrL3LzRXxgHDy5V7SuJ1jH0KIHpoh4QCueeKHoRf
 IEAg==
X-Gm-Message-State: AOAM532O+8qB35OPM2Ho5MSR6CH+bPp/Ssa34BF/Rlz1lY1zo4WUCAZc
 7uXCXjhoU3s+ZeBU7PSyKi8fIhzZOnlUtKSow6fsI3cuxMMlNyxY/5gEsAXE30jOwh4xcOfFwTo
 sPbDXfPUP4fzimq8=
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr27431710wmb.199.1649659524391; 
 Sun, 10 Apr 2022 23:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhPinAVPHthJAZlNcdLeMaEDJRruJztX/Tae6+U7TPWEkR6QMtf49IGsDNhKYlpFHLtRN7gg==
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr27431695wmb.199.1649659524122; 
 Sun, 10 Apr 2022 23:45:24 -0700 (PDT)
Received: from [192.168.42.76]
 (dynamic-046-114-150-203.46.114.pool.telefonica.de. [46.114.150.203])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a056000168f00b002057a9f9f5csm30532550wrd.31.2022.04.10.23.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 23:45:23 -0700 (PDT)
Message-ID: <f4312553-1605-625e-5a33-7bf09ebbd566@redhat.com>
Date: Mon, 11 Apr 2022 08:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>, Guo Zhi <qtxuning1999@sjtu.edu.cn>
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
 <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
 <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/04/2022 21.19, Daniel Henrique Barboza wrote:
> 
> 
> On 4/6/22 07:08, Bin Meng wrote:
>> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>>>
>>> There are still some files in the QEMU PPC code base that use TABs for 
>>> indentation instead of using  spaces.
>>> The TABs should be replaced so that we have a consistent coding style.
>>>
>>> If this patch is applied, issue:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/issues/374
>>>
>>> can be closed.
> 
> Please add the following tag in the commit:
> 
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
> 
> 
> This will make Gitlab automatically close the issue when the patch is accepted.
> 
>>>
>>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>>> ---
>>>   hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
>>>   hw/ppc/ppc440_bamboo.c |   6 +-
>>>   hw/ppc/spapr_rtas.c    |  18 ++--
>>>   include/hw/ppc/ppc.h   |  10 +--
>>>   4 files changed, 109 insertions(+), 110 deletions(-)
>>>
>>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
>>
>> uboot_image.h was taken from the U-Boot source, I believe it should be
>> kept as it is.
> 
> 
> (CCing Thomas since het explictly listed hw/core/uboot_image.h in the bug)
> 
> 
> I am not sure about keeping this file as is.

Seems like uboot_image.h has originally been taken from U-Boot's 
include/image.h file ... but the two files are completely out of sync 
nowadays, e.g. U-Boot switched to enums instead of #defines at one point in 
time. So I think it does not make much sense to keep the TABs in here, and 
I'd rather like to see them replaced with spaces indeed.

  Thomas



