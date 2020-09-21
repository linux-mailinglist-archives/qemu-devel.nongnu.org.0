Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CA271942
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 04:23:50 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKBUb-0002Ua-Cq
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 22:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kKBTd-00024r-0w
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 22:22:49 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kKBTY-0000Jq-IY
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 22:22:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id u3so6348014pjr.3
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2W1I0uAm+1POor6UtKbJVyr/Nv8e6JyklZ++7kOlyDc=;
 b=W/FzUPlHW/ZY3P98Obau/VYJRZyTzjTnYR2pUWSXqaQV2Xfe2YhWM1O+VMyzMPtuNM
 gDlF2ODdz86iPHxqBNoOGhpRXeMh8LrZv8WdHSbBnrwHas8vmdOxVTar7ta5LMSOft6p
 3uYPmBOyGnGGUAown1mKNROcMKht4UVwjAwC7D+cs7FtpNpIDf+pelqby4Y+MqwAS3sl
 RBDm3hiUYwZGNDwffossyEYuY9ifji1gEmLDlNHm7yulGWjwrcUslX84qRTKx158txBE
 FcDcU8+UCfw3CMRetSiWipaUFVwLn1kp/jVWdCen4nseLkb6v5N+szNd7Deuj1C4qQlz
 h5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2W1I0uAm+1POor6UtKbJVyr/Nv8e6JyklZ++7kOlyDc=;
 b=i0PudaUq2qv5ircetLNwH6dP5i3XDvLrk6oObiuYaIkVG5/UhmNF9pOPanK9qOsfp/
 w2BWMvOZh6LoOSE6ti/wGqUGrS86MpplZbL8ryPCKrslAJZ1q2DtBm3w/TFGcvK7b4p3
 ykZTgyCcYnj2FB0Az2JeVft5FhueiB82cy57ifPXHzxvdT9NJimAeJ7jpUFTXsfc5zBY
 rmSSt/mt3CVNGScIZMSoccFL4DXfNi+8Pf/4G1R9dMmLmhWH6rAj75avTpBsCwH1Zb/u
 3xJzxWuStsWDCRppUw5Ihc8KhROqd5+MO1UZinPr2V8LibldzTEz+6FWeD1pckcwru6L
 Xrig==
X-Gm-Message-State: AOAM533uneAZWGJoRxhe0EQGQLOe9rC9pA+L4oW3+ZDOZ+LdkjeT4lVR
 GkRf0vJpi08C557addFsKDPc2w==
X-Google-Smtp-Source: ABdhPJyU8Em9II/6I72wzoHBy2NptA+/68YNGPyTxCX7elFYgS+LW2uo+auX+G1pSNKCFSYA28tzKg==
X-Received: by 2002:a17:90a:9912:: with SMTP id
 b18mr24024458pjp.192.1600654962267; 
 Sun, 20 Sep 2020 19:22:42 -0700 (PDT)
Received: from [10.2.218.189] ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id z129sm9816585pgb.84.2020.09.20.19.22.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Sep 2020 19:22:41 -0700 (PDT)
Subject: ping: [PATCH 0/3] add MEMORY_FAILURE event
To: armbru@redhat.com, pbonzini@redhat.com, mtosatti@redhat.com
References: <20200914134321.958079-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <b38abe18-0211-d2fc-d843-c081227ac05e@bytedance.com>
Date: Mon, 21 Sep 2020 10:22:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200914134321.958079-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

A patchset about handling 'MCE' might have been ignored, can anyone tell 
me whether the purpose is reasonable?

https://patchwork.kernel.org/cover/11773795/

On 9/14/20 9:43 PM, zhenwei pi wrote:
> Although QEMU could catch signal BUS to handle hardware memory
> corrupted event, sadly, QEMU just prints a little log and try to fix
> it silently.
> 
> In these patches, introduce a 'MEMORY_FAILURE' event with 4 detailed
> actions of QEMU, then uplayer could know what situaction QEMU hit and
> did. And further step we can do: if a host server hits a 'hypervisor-ignore'
> or 'guest-mce', scheduler could migrate VM to another host; if hitting
> 'hypervisor-stop' or 'guest-triple-fault', scheduler could select other
> healthy servers to launch VM.
> 
> zhenwei pi (3):
>    target-i386: seperate MCIP & MCE_MASK error reason
>    iqapi/run-state.json: introduce memory failure event
>    target-i386: post memory failure event to uplayer
> 
>   qapi/run-state.json  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   target/i386/helper.c | 30 +++++++++++++++++++++++-------
>   target/i386/kvm.c    |  5 ++++-
>   3 files changed, 73 insertions(+), 8 deletions(-)
> 

-- 
zhenwei pi

