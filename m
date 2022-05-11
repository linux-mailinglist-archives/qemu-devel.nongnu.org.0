Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37BF5231B9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:32:25 +0200 (CEST)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokZs-00012l-UD
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vulyanov@suse.de>) id 1nokXl-00083M-Jz
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:30:15 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vulyanov@suse.de>) id 1nokXj-0006w7-Ra
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:30:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29B6121A24
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652268609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=coWvXrhxyVIIjCYOyPW+MeCQCHCH8py5OJaGKvZMHhU=;
 b=wPn3ygncxZw/w12KHy9p1vnr7zK6AJldIQsCAz9kJyEbx7XIjIhV9mhg4IibmVTOlTzMsS
 tXqRgIfFhhidgbw1bS7ECeEtsFDUeJJqa1c5N9RLRsQqU2NihNsJVy4no7cb1i7WDKR7vQ
 HtDNQHeh0nqYRpbfB/jeU7VhZ44S1BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652268609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=coWvXrhxyVIIjCYOyPW+MeCQCHCH8py5OJaGKvZMHhU=;
 b=lVqLXjTGLfALipjkBO2lCkdY+O80nKYKjOpd6rDTP/OgxqeT3ZzA6wu9TScyGzFq03ri6u
 3ClnN/PhfZ7cB+Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E721F13A76
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 11:30:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /QEmNECee2J4SQAAMHmgww
 (envelope-from <vulyanov@suse.de>)
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 11:30:08 +0000
Message-ID: <d0c41d34-2ae3-39ac-58df-bbdf81bf79b6@suse.de>
Date: Wed, 11 May 2022 13:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Vasily Ulyanov <vulyanov@suse.de>
Subject: Adjusting the default ROM option for SEV guests
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=vulyanov@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello QEMU devs,

Currently to launch an SEV guest there are certain requirements for the VM
configuration. One such is that ROM option needs to be disabled for virtio-net
devices [1]. The tools like virt-install or libvirt rely on the QEMU defaults if
the ROM value is not provided (the default for virtio-net is set to
romfile=efi-virtio.rom). Eventually this leads to unbootable guest and poor user
experience as it is now mandatory to explicitly disable the ROM option.

There is a similar situation with iommu_platform, though that seems to be
addressed already in [2] and QEMU adjusts the defaults depending on whether it
is a confidential guest or not.

Wouldn't it make sense to also handle the romfile like that in QEMU? I.e. in the
case when an SEV guest is run and no romfile is explicitly specified set it to
an empty value? This will also be useful when running an SEV VM directly with QEMU.

Are there any objections or concerns? I could work on the patches but wanted to
ping the community first and get some feedback. Would QEMU be the proper place
to handle that? Any thoughts?

[1] https://libvirt.org/kbase/launch_security_sev.html#virtio-net
[2] https://gitlab.com/qemu-project/qemu/-/commit/9f88a7a3df

-- 
Vasily Ulyanov <vulyanov@suse.de>
Software Engineer, SUSE Labs Core

