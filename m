Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0C6E0DED
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:03:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwbJ-00013x-24; Thu, 13 Apr 2023 09:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmwbF-00012h-8l
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:02:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pmwbD-00088w-HQ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:02:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 050C4218B1;
 Thu, 13 Apr 2023 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681390970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4esLcQabBpQUnaHnLKcOaJI9uy3afaQ8YTVeAahI0rU=;
 b=u+sG54T/+DVh3v2rtFGvC3CHkbjxyd2zOtQKP9S9iiJAO8iVzhhy9/IhvZfkHUe0k9Q2rs
 tkWnauRJ9W75mD6/qJq+qzJr6eIbuHfDdiPm552TJFgcjjMLsNxVbvWI7sljiQIR4Mi8My
 06JT3feSoO8dy8BBWe6nDUmtoCVjwHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681390970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4esLcQabBpQUnaHnLKcOaJI9uy3afaQ8YTVeAahI0rU=;
 b=nULo3bkg/dZt9RY/TSeU8fgXBpbS/LSoi5Fx/TFxYAjWR76YqO5432kPf3q/IgeLrIiKZF
 41JojNxISVCZRNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 814CB1390E;
 Thu, 13 Apr 2023 13:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q/BBEnn9N2R/EwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 13 Apr 2023 13:02:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Hyman Huang
 <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] softmmu: Move dirtylimit.c into the target independent
 source set
In-Reply-To: <20230413054509.54421-1-thuth@redhat.com>
References: <20230413054509.54421-1-thuth@redhat.com>
Date: Thu, 13 Apr 2023 10:02:47 -0300
Message-ID: <87v8i0ylxk.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

Thomas Huth <thuth@redhat.com> writes:

> dirtylimit.c just uses one TARGET_PAGE_SIZE macro - change it to
> qemu_target_page_size() so we can move thefile into the target
> independent source set. Then we only have to compile this file
> once during the build instead of multiple times (one time for
> each target).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

