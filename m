Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ABE2D00A6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 06:24:56 +0100 (CET)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klmXX-00085U-ES
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 00:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1klmWJ-0007E3-L3
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 00:23:39 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1klmWF-0006Pp-Nk
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 00:23:39 -0500
Received: by mail-pg1-x543.google.com with SMTP id g18so6233178pgk.1
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 21:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WJEjxpjF6mEICWmDa4XQeloos4iUaf8xHXL95Mn1A+8=;
 b=deDq3OEGXpxaM7KqsFdGaerHuWnu9tgz/chfUfC+O1FEUXid8CUk7pdZq2gDqE8xTs
 M0A94DsvtQX7eQXWEpgcJHx3DfndOYy0+BQxdO+yZz4+DKawbVuOEFxA73AYSCCAKUe7
 76kOU+YSMuTRnE0C7duYCxVAtirjsQ1Q2nZWjRUhHLUYdjoBtBLhuN8zRojUiKYBTWPd
 yRLeHzM/95vy0ifZ1n4zK5U0Q75YxjJu8k7Jv4Cr5ok9UT7pviKuTwtsrawhRI80J99R
 fn4v3Zm6K6hwr9L2S51bONBdOPTEAfsulszpdqaRO2ZroW9idw1RCMlLk3L73P/oW2zJ
 mUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WJEjxpjF6mEICWmDa4XQeloos4iUaf8xHXL95Mn1A+8=;
 b=T4XKGgIciCbP5CEArX7FNQvSIHaxOb7iA10W+obCWVnE7TOHRZFcq1hmfAP//YsAry
 Hk8E0knN1pg33qNfHN78FwpaPgRP6Ffo3EkYgH9nx9LJU7YwXxAD3GBgxZVj6I6h0hvs
 DvN3AEZ5Xwy0iVtYIa0VkZFbOi8HdMladR0ngXpuop1d0yLcDyRlKhF+nVBNsEE3MTXI
 EUKY/UJrJSxEG8yZkA3OSZ3EgIFOandx0mxnbEBLep7C99rXMDDVrrpngqhG7yn3o4yy
 cEk0MjkJGfuOFCPYCx7nx+3kQUgaI7iXGF8yIGac/wgyn7ZEfQ2QHsBNIUVQwIGNznmm
 RZ9w==
X-Gm-Message-State: AOAM530KdwtWzf32B8xuH3cPZCe7GHwyPoG3S5SighoZ6XmHWXlZNyjV
 QG9IW1TMAVqLnUCwl5znytzvbdAVBPc0BA==
X-Google-Smtp-Source: ABdhPJxsG9cf30IBDmF1f63PSNl+B+KmOS+GxS02AEWYaz7e2tt/reRgIwtb0O/4ZrAPF8LwDYQZlg==
X-Received: by 2002:aa7:928c:0:b029:19a:de9d:fb11 with SMTP id
 j12-20020aa7928c0000b029019ade9dfb11mr10948758pfa.21.1607232211853; 
 Sat, 05 Dec 2020 21:23:31 -0800 (PST)
Received: from [192.168.10.153] (124-171-134-245.dyn.iinet.net.au.
 [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id u24sm10243834pfm.51.2020.12.05.21.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 21:23:30 -0800 (PST)
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
To: Greg Kurz <groug@kaod.org>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan> <20201204194312.7ea1fdb2@bahia.lan>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <01907641-fef7-4bc7-3481-20bd27690136@ozlabs.ru>
Date: Sun, 6 Dec 2020 16:23:25 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201204194312.7ea1fdb2@bahia.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x543.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/12/2020 05:43, Greg Kurz wrote:
> On Fri, 4 Dec 2020 19:32:05 +0100
> Greg Kurz <groug@kaod.org> wrote:
>>
>> That's all for now.
>>
> 
> Just one last item. I'm observing failures with nvram in the guest:
> 
> [root@vir76 ~]# nvram --print-config
> [   88.179444] nvram[936]: unhandled signal 11 at 00007fffc83a0000 nip 000000012d802110 lr 000000012d802118 code 1
> Segmentation fault (core dumped)
> 
> Haven't tried to figure out why yet.


Yeah, I am seeing them too but unless we decide to continue with this 
one, debugging/supporting this feels like a waste of time imho :) The 
patch is already big, although I guess I could have added a stub for nvram.



-- 
Alexey

