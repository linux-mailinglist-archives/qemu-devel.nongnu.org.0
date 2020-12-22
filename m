Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED82E0A2C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 13:49:45 +0100 (CET)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krh6l-0006ZI-Ee
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 07:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1krh1F-0005mK-BL; Tue, 22 Dec 2020 07:44:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1krh1D-0005mb-Fe; Tue, 22 Dec 2020 07:44:01 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A2E28407C2;
 Tue, 22 Dec 2020 15:43:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id AB0C27C;
 Tue, 22 Dec 2020 15:43:47 +0300 (MSK)
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
To: Marian Posteuca <posteuca@mutex.one>, qemu-devel@nongnu.org
References: <20201222113353.31224-1-posteuca@mutex.one>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
Date: Tue, 22 Dec 2020 15:43:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201222113353.31224-1-posteuca@mutex.one>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -93
X-Spam_score: -9.4
X-Spam_bar: ---------
X-Spam_report: (-9.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 14:33, Marian Posteuca wrote:
> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
> table name.
> 
> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
> found, the game crashes(this may be an intentional detection
> mechanism to prevent playing the game in a virtualized environment).

This isn't a technical question/comment about the patch itself, but
about something different.  Do we really want to play this whack-a-mole
game? If we change ACPI table IDs, those who want to disallow running
their software inside qemu/kvm will find some other way to check for
this environment. We will change that, - just to be found again. And
so on.. is it productive? I don't think so.

I'm not against this patch in any way, not at all, - having this ability
is good for other purpose too. But I think we can't won in this "detect
if we're running under qemu" battle easily. And the next version of the
same game will have a more sofisticated detection method and we won't
even know which way they used.

Thanks,

/mjt

