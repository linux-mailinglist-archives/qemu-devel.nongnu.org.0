Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562436F7146
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:41:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoL-0006xi-Da; Thu, 04 May 2023 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYxf-0007Ku-Df; Thu, 04 May 2023 09:25:31 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYxd-0002xh-SJ; Thu, 04 May 2023 09:25:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F35DA1FD79;
 Thu,  4 May 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683206727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HcMII6ChGAGYjOLxXTYDfDqToJxPc9woYkrHQEvR0zQ=;
 b=V1+WaIfsBqJ8Fbp0v9pXFkVptlG7GXiR4nl4FS1tUHMW0jPiGquQyLo3pMsmv+wYa8OpoT
 tGpuHlh5YMYgNghgKHluW2LSS2Wny7WvTRqTsuTq0cv8QWL7yoOwfMCng7KGrLYPHDZOd5
 DQ7tGkdx112VPd/I87ePmlQsyLBkbwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683206727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HcMII6ChGAGYjOLxXTYDfDqToJxPc9woYkrHQEvR0zQ=;
 b=6IAGFArM045cOqKu6ZJywzIIvcCpmnv6dSwWQ2u+DTs0yAvN09A9s2SMk5nIhtrUOODDaA
 7lKT7V7j3U+pDRAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7454313444;
 Thu,  4 May 2023 13:25:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNReD0eyU2QfXQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 13:25:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Move translate-a32.h, arm_ldst.h,
 sve_ldst_internal.h to tcg/
In-Reply-To: <20230504110412.1892411-2-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
 <20230504110412.1892411-2-richard.henderson@linaro.org>
Date: Thu, 04 May 2023 10:25:24 -0300
Message-ID: <87lei4jkjf.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> writes:

> These files got missed when populating tcg/.
> Because they are included with "", no change to the users required.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

