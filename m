Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A66D29F9
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 23:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piMI0-00022W-OR; Fri, 31 Mar 2023 17:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1piMHy-000221-MU; Fri, 31 Mar 2023 17:28:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1piMHx-0005lv-8i; Fri, 31 Mar 2023 17:28:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C95901FE88;
 Fri, 31 Mar 2023 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680298079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SeVP9Xk8vvDWsL10KFW23yu951sK97RIcvnNX3GaC/A=;
 b=OYs2UkE0Z8jeweh1NyOiMR+eKLE84uj/1bOZ25zpp3sqZftptdPfQigGSSP8UEL/AacqXv
 kSQu24b5g0ixGfeVXyeLfYR0lrYlxf0wv/PWpF0qmahHLxMgLyttnTqyYCitce18YXaOaM
 ba64rhbfxy1iN1VloZgrWhx1R/Uaz5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680298079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SeVP9Xk8vvDWsL10KFW23yu951sK97RIcvnNX3GaC/A=;
 b=Zw5Lso4HuWoRZwGupXqkGBD3IrF1E0w6Wt7t5ZFWFldTQQr6o1ozxhmEvya+oxXJBww2Kr
 hA6hNvYCAPpi+xDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42824134F7;
 Fri, 31 Mar 2023 21:27:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sULYAl9QJ2QYJAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 21:27:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 3/6] target/ppc: Fix instruction loading endianness
 in alignment interrupt
In-Reply-To: <20230327131218.2721044-3-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
 <20230327131218.2721044-3-npiggin@gmail.com>
Date: Fri, 31 Mar 2023 18:27:56 -0300
Message-ID: <87bkk8zk4j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Nicholas Piggin <npiggin@gmail.com> writes:

> powerpc ifetch endianness depends on MSR[LE] so it has to byteswap
> after cpu_ldl_code(). This corrects DSISR bits in alignment
> interrupts when running in little endian mode.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

