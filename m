Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F5667ABC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:26:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0OH-0006QA-CF; Thu, 12 Jan 2023 11:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unisono@quyllur.org>)
 id 1pG0OB-0006Pq-TY
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:25:16 -0500
Received: from quyllur.org ([185.247.226.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <unisono@quyllur.org>)
 id 1pG0O9-0006LW-Du
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:25:15 -0500
Received: from quyllur.org (localhost [127.0.0.1])
 by quyllur.org (OpenSMTPD) with ESMTP id a1cd2921
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 18:25:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=quyllur.org; h=message-id
 :date:mime-version:to:from:subject:content-type
 :content-transfer-encoding; s=dkimselector; bh=YoiCIVpM0dnmaJjl5
 y3vO211hzE=; b=uU/I5a8dn2UMegyzQDhj9tWvFy9ZvxxJpqeNW5aac7QnsM5DG
 KP4cfDXh9XKTjP/3xJ+Xi6UQMRP/HIA/4VP6NuSJrOYWJzw3VLIrlhO9PvHo6Epi
 DTnv9YIOKUHXJFB2cRFPrgIdaA87Q3niPm9tlatXTCiM75lLMqoxfr5MOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=quyllur.org; h=message-id
 :date:mime-version:to:from:subject:content-type
 :content-transfer-encoding; q=dns; s=dkimselector; b=0SQcuksZ/Sx
 +0RIY6YUvKzrIfQjxJqRQJ7XOrhQpJKsYUx716mmI3dyiy3WEUHky/I2SgDibGYF
 0PAI3OB9Bl8eQ4dzeVQ/G8Z/m9PkkVjjqZ/Wskw39Jdd0xLEtVRwat5yGVbrNmVJ
 1jdASPYjo/dKzGIfRffp76aAbqPul8tY=
Received: from [10.137.0.52] (h-217.114.218.27.keyweb.de [217.114.218.27])
 by quyllur.org (OpenSMTPD) with ESMTPSA id 905eaa5a
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO)
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 18:25:02 +0200 (EET)
Message-ID: <c4ec12d4-e07c-ada9-5cec-744dae7c069b@quyllur.org>
Date: Thu, 12 Jan 2023 11:24:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: qemu-devel@nongnu.org
Content-Language: en-US
From: Rot127 <unisono@quyllur.org>
Subject: [Capstone] Feedback request for new architecture updater
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.247.226.42; envelope-from=unisono@quyllur.org;
 helo=quyllur.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I currently work on a new updater for architecture modules in Capstone.

The current update process has the problem that it is a lot of manual work.
Syncing the information from LLVM to Capstone requires a one to 
translate a lot of C++ to C code and fix a ton of build errors.
This lead to architecture modules not getting updated. So there are many 
new instructions in Capstone which are not supported.

The new updater will take away as much manual work as possible.
It does this by translating most C++ to C via a little translation tool 
and uses refactored LLVM-TableGen backends which emit directly the code 
Capstone needs.
Currently it is in a early stage but it is ready to receive some feedback.

If anyone finds the time to take a look at it and write down their 
thoughts, suggestions or improvement ideas, I would be very grateful.

Capstone draft PR: https://github.com/capstone-engine/capstone/pull/1949


