Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDC50A6FE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:22:57 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaW9-0005Ek-1l
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1nha26-0007Ae-Uw; Thu, 21 Apr 2022 12:51:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:52212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1nha25-00055P-C9; Thu, 21 Apr 2022 12:51:54 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA663210E8;
 Thu, 21 Apr 2022 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650559910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7vxCXKePMi7QA9SeEbyHvmHor/nQsmQdX7q1fQJw2E=;
 b=YzsbuLmm/BG8i9qG5MWQ2BCF7IBZVlRXpc2I+OXlcBVCvuz7c+xxFHiXQmZj/060aXyGZL
 f1JYVN1FPRMe1V4qs1lS0PCYnhnnDKQ/cLsEkgEA+uaUpx/BxTSnMHnkWdMdOVwu6YXhgD
 JeFzeuxXYhkrvAAv+YeWonMtRrvFsnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650559910;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7vxCXKePMi7QA9SeEbyHvmHor/nQsmQdX7q1fQJw2E=;
 b=x1610UsPoh5FHMw53ayMzM3nM/BnnzSQIFKxF/5EldWPX2mBqx353RsqpE57kCWseshRLB
 ehjrnUcSX+oG8CBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A7F113A84;
 Thu, 21 Apr 2022 16:51:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kUplJKaLYWK+AgAAMHmgww
 (envelope-from <dmueller@suse.de>); Thu, 21 Apr 2022 16:51:50 +0000
From: Dirk =?ISO-8859-1?Q?M=FCller?= <dmueller@suse.de>
To: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] Only advertise aio=io_uring if support is actually
 available
Date: Thu, 21 Apr 2022 18:51:50 +0200
Message-ID: <11988119.O9o76ZdvQC@magnolia>
Organization: SUSE Software Solutions Germany GmbH; GF: Ivo Totev;
 HRB 36809 (AG =?UTF-8?B?TsO8cm5iZXJnKQ==?=
In-Reply-To: <Yl/FYrWfjAOeIl94@redhat.com>
References: <20220419171931.26192-1-dmueller@suse.de>
 <Yl/FYrWfjAOeIl94@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dmueller@suse.de;
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 20. April 2022 10:33:38 CEST Daniel P. Berrang=E9 wrote:

Hi Daniel,

> That all said, the patch itself is OK, because for human targetted
> interactive usage, it is desirable for --help to be representative
> of what's available.
>=20
> IOW, I'm just complaining about the commit message justification
> here & warning against writing tools to use --help :-)

understood, thank you for the good feedback, I've sent a v2 with a reworded=
=20
commit message.=20

Greetings,
Dirk




