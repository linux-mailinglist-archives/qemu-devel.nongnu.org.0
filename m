Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B395AD9E5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 21:51:18 +0200 (CEST)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVI7o-00049S-NW
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 15:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVI4m-0000FM-DB
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 15:48:08 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVI4k-0007si-TK
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 15:48:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E71041FAB1
 for <qemu-devel@nongnu.org>; Mon,  5 Sep 2022 19:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662407284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yqUdovfxJ6rT4CeuRaukoPdfrZ+66hWVsChM6nXAR1o=;
 b=NTHbYp+9QYfYUHFO6TcAj9WGFns1LRVTCmnBvr4gbNuVfXGXnXziFq9ycRBPd4q6o7pAWg
 t2C/RkDTAxoB9nfV0d6/4f/zejAKon76suklhTdpCjw7lmXIPaOpgahcoAZScik3iRGa15
 x5wFheqJpjZC5CbEiQ0GU4+cYYvoRvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662407284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yqUdovfxJ6rT4CeuRaukoPdfrZ+66hWVsChM6nXAR1o=;
 b=ROug1KKiWngveRSeVS36/GVhoRk2VE6+LmGWxYhPQ5X1TFXBy4uZJk3hCg5JYEfBan0ZWZ
 lwhe67cQnCyHA9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D332013A66
 for <qemu-devel@nongnu.org>; Mon,  5 Sep 2022 19:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AROvMXRSFmOOQQAAMHmgww
 (envelope-from <cfontana@suse.de>)
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 19:48:04 +0000
Message-ID: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
Date: Mon, 5 Sep 2022 21:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: sphinx-build is really slow, any way to improve that?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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

Hi all,

when I build qemu, there is a lot of time spent at the end of the build where one cpu goes 100% on sphinx-build.

Is there some way to parallelize that? It seems it is the current bottleneck for rebuilds for me..

Thanks,

Claudio

