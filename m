Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210224E647B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:55:00 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNvW-0000hR-SP
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:54:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nXNod-00056x-8p
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:47:51 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nXNob-0007Rx-KU
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:47:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 028C1210FD
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648129667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ICu1z1VFq9RCMduEj5xldYTgJja5v4okkMfh92ucmWI=;
 b=1rHdQbtA6Xk+BlFKOKtwAy8Eq4b6vlk7iQABUvyvQQHQdymir7a31Fgm0WeVlJ6PfleOar
 GzQLeNn67DNM4UmNrdkyK4oy2Bzfo412w5xaAC3FXRB4OEm7Hr7XBU7D0Mp8+/7zhRSBms
 kTyVwfviioaI5EXjPtXQXpkUZrrDCNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648129667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ICu1z1VFq9RCMduEj5xldYTgJja5v4okkMfh92ucmWI=;
 b=JI++qksfA4f8tj5vKEuIQAj7qt8zxTJIzrsXrFTN+tA5SyegmwKVIsuf5khwWTMyjYOGO8
 SdsDqhazkVAIItAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8B5512FF7
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8VPvMIJ2PGLodAAAMHmgww
 (envelope-from <lizhang@suse.de>)
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:47:46 +0000
Message-ID: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
Date: Thu, 24 Mar 2022 14:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Li Zhang <lizhang@suse.de>
Subject: iotest40 problem
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
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

Hi,

When I run the testsuit on our buidling system, it reports a timeout 
sometimes not always as the following.
It couldn't connect qmp socket. Any ideas about this problem?


[ 1989s] --- 
/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040.out
[ 1989s] +++ 040.out.bad
[ 1989s] @@ -1,5 +1,55 @@
[ 1989s] -.................................................................
[ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed to establish 
connection: asyncio.exceptions.CancelledError
[ 1989s] 
+E..................................ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed 
to establish connection: asyncio.exceptions.CancelledError
[ 1989s] +E.........................
[ 1989s] 
+======================================================================
[ 1989s] +ERROR: test_commit_node (__main__.TestActiveZeroLengthImage)
[ 1989s] 
+----------------------------------------------------------------------
[ 1989s] +Traceback (most recent call last):
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040", line 
94, in setUp
[ 1989s] +    self.vm.launch()
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 399, in launch
[ 1989s] +    self._launch()
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 434, in _launch
[ 1989s] +    self._post_launch()
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
line 147, in _post_launch
[ 1989s] +    super()._post_launch()
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 340, in _post_launch
[ 1989s] +    self._qmp.accept(self._qmp_timer)
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
line 67, in accept
[ 1989s] +    self._sync(
[ 1989s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
line 41, in _sync
[ 1989s] +    return self._aloop.run_until_complete(
[ 1989s] +  File "/usr/lib64/python3.8/asyncio/base_events.py", line 
616, in run_until_complete
[ 1989s] +    return future.result()
[ 1989s] +  File "/usr/lib64/python3.8/asyncio/tasks.py", line 501, in 
wait_for
[ 1989s] +    raise exceptions.TimeoutError()
[ 1989s] +asyncio.exceptions.TimeoutError

