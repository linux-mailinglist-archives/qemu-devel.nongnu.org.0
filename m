Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BA42D62E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:35:53 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1max9S-0006jr-8q
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1max5t-000504-Gv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1max5p-0001Ek-5U
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634203923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=duyHV1xi5eRMt47ZZ+HzkLe7tx9s0UCgP2nTKBwykzM=;
 b=jAIndYTDEXKXFAvT0ZUS3DKfWUSxb8crRxHqh1Vvj9IGbwazbNxUFxuEtMHJ9uTHzQunyQ
 ELtdoJLwJds8cheV0yO4If0grxweAeY/LmeRbi6yiLMohvxhpLuuyh+RxloO7lq0tOMwFr
 0ZH5GU8+ImNMJXu7h95Ls65sIjzlTk4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-xalUrr6pOam1aYxZHPnJLg-1; Thu, 14 Oct 2021 05:32:00 -0400
X-MC-Unique: xalUrr6pOam1aYxZHPnJLg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso4076114wra.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=duyHV1xi5eRMt47ZZ+HzkLe7tx9s0UCgP2nTKBwykzM=;
 b=atY6UA7/tvp3cMuy+f6gaEXNJacf/TqPOhraCbKDgAULuH+7Cpzx2vtoJ+5rFJaeLo
 p3Zh08ox/moufSo/PP2xvkPwR07x4jOIFB+D0+bA2Z6RvqgmK6qXRTvsei6nX8ae5aXx
 wZbvr2MFY816U9BREc3MPGywww0D8DIgPEnvtcfAql0pIe/BZvcmhpEB/0tmyEbWCdCL
 VbNLOwykHziA+c/8DeGfyxjZyJWACTbGViEg0Rg3p+exC2HTApBv+/TbQV6DtwXvkk0E
 GkRWz8FBQcvL1JLSCX7F1vMWz6LM3pgZVybEVB5HX+Hi2/m1UVA8vVOMJP3BcUy2POEZ
 mibQ==
X-Gm-Message-State: AOAM532Mwpl9vA0A0z1IGUpXAr9J2pPITGAVW3qB4zRcX53HBfhEqqCT
 t8kJIxk7FMdCrb+AuHl7ravzEnz/9AE775Gy7ytDJyVJToBSPXwa89F+dXuHhtapTD83PYYcnoy
 2vm1paT8gLZlA9G0=
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr4668674wmf.8.1634203919442;
 Thu, 14 Oct 2021 02:31:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWrB0QKHuiegP1MEBJCHmshSQnz5qJ6z/xvsDx+LT8XVwVYJ4XCYfTJDbFGP9bPNllkDTKLQ==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr4668642wmf.8.1634203919121;
 Thu, 14 Oct 2021 02:31:59 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p18sm722684wmq.4.2021.10.14.02.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 02:31:58 -0700 (PDT)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Is the ppc440 "bamboo" board in QEMU still of any use?
Message-ID: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
Date: Thu, 14 Oct 2021 11:31:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi,

I tried to build a current Linux kernel for the "bamboo" board and use it in 
QEMU, but QEMU then quickly aborts with:

  pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.

(or with a "DCR write error" if I try to use the cuImage instead).

I googled a little bit and found this discussion:

https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2

Seems like this board was used for KVM on the PPC440 only, and has never 
been enabled with the TCG emulation?

Well, KVM support on the 440 has been removed years ago already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea

So is this "bamboo" board dead code in QEMU now? Or does anybody still have 
a kernel binary which could be used for testing it? Note: This board does 
not support "-bios", so u-boot or other firmwares are certainly also not an 
option here...
Should we mark "bamboo" as deprecated nowadays?

  Thomas


