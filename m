Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658756A8733
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXm53-0002WQ-M7; Thu, 02 Mar 2023 11:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pXm50-0002Vw-2w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:46:54 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pXm4y-0007Ne-8C
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:46:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2DA2422015;
 Thu,  2 Mar 2023 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677775610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZzhDxFobkuxdPnB4CwvVs4xVfjSzEgtCTSEesyVFzzI=;
 b=B2+DEyMfWwEagQYfpQGFlHeFy4cpPuwq8AFXJbMt4/unjWiVKUuYl64xlKg0D4Sbw7Gdfh
 meOBM5mHDK2eHqmmJ4OGNYmwPqrU4l5yryDVmIn/KbXo/hN2dbbjogSdyIxsN83S2bHTP9
 84+6b7c/HLKHKkp4dQmfJ4unw/7E8iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677775610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZzhDxFobkuxdPnB4CwvVs4xVfjSzEgtCTSEesyVFzzI=;
 b=OC1dmsAmUpXzDFMse9AltFWQYztnL+g0SH33DQnSwY7VcysO6fSxJedPPUH2pOoBpc79Hz
 Nk10l5o/1Ym9eEBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2E8513A63;
 Thu,  2 Mar 2023 16:46:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZzAeH/nSAGQqNAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 02 Mar 2023 16:46:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, berrange@redhat.com
Subject: Re: [PATCH v2 01/34] Revert "tests/qtest: Check for devices in
 bios-tables-test"
In-Reply-To: <20230302161543.286002-2-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
 <20230302161543.286002-2-imammedo@redhat.com>
Date: Thu, 02 Mar 2023 13:46:47 -0300
Message-ID: <87fsan2j9k.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Igor Mammedov <imammedo@redhat.com> writes:

> This reverts commit c471eb4f40445908c1be7bb11a37ac676a0edae7.
>
> which broke acpi tables test and rebuild due to skipping some tests
> even thought none of devices tests depend on weren't disabled.
>
> As result it leads to some expected tables not being updated,
> merge conflicts and tests failure.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

Acked-by: Fabiano Rosas <farosas@suse.de>


