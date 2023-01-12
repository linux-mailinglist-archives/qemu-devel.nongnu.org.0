Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87482667618
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:28:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyRG-0003vC-CF; Thu, 12 Jan 2023 09:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pFyRD-0003s3-3z
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:20:15 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pFyRB-0000dw-8K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:20:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E0CE3F2CC;
 Thu, 12 Jan 2023 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673533210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAYh3XClaXbVjEDKYCPc8JW+SLNbr+jjZuj2EoqHTbc=;
 b=TWZ5G1t7j2l6/rWQAjzcllXeFD97E+8WO/KN3N84eguazbNQcJTCWhQA+mk+8GKEKy8rjC
 x1T7zpaWWotorT8iMfI0W97TD6bQlJ7b+Pq6X7K3UNiFIFK19p+4jJxBrv7U4WSOK+Xivq
 0DE2Wv8B/zuUPLwmJO7ZlWPJxq1jYw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673533210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAYh3XClaXbVjEDKYCPc8JW+SLNbr+jjZuj2EoqHTbc=;
 b=DlnKvl3Z7U+o5WA7/kxMIG14wj48JJfz2v0VIRyelc0vpEwF0LbFY86zIQuUvMRz9jMfpR
 Oa1xiCjYkf2tprBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB94513585;
 Thu, 12 Jan 2023 14:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YfBTHBkXwGO+AQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 12 Jan 2023 14:20:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Introduce aarch64_set_svcr
In-Reply-To: <20230112004322.161330-1-richard.henderson@linaro.org>
References: <20230112004322.161330-1-richard.henderson@linaro.org>
Date: Thu, 12 Jan 2023 11:20:07 -0300
Message-ID: <87lem7hm20.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Richard Henderson <richard.henderson@linaro.org> writes:

> Unify the two helper_set_pstate_{sm,za} in this function.
> Do not call helper_* functions from svcr_write.
> Cleans up linux-user usage by consolodating logic.
>
> Cc: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Fabiano, I expect this to replace much of your
>
>   [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into cpregs.c

Thanks!

Reviewed-by: Fabiano Rosas <farosas@suse.de>

