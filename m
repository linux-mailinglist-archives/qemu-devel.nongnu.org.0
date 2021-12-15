Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2247541A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:09:35 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPLx-0006mB-25
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:09:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pvorel@suse.cz>) id 1mxP9R-0008Lb-Iy
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:56:37 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:58914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pvorel@suse.cz>) id 1mxP9P-0002wI-9o
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:56:37 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3EF8E212C0;
 Wed, 15 Dec 2021 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639554991;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpZnTgfJAKDwFgGdEnzMi1mhx1eA2KNlH7kbVFZA4D0=;
 b=Hwgfex3WIcVDnuUBTxFxj4MSr+FQSVSN67mcAAVyZolv8l87fjyIfLhaRdsSlLGDQkH4MC
 IH2BGSroU2GyOCawtGcy8p8PrRkY3lSHjBkcLkdlWX/J9YmHvXH+dXS+KnJDW2xQQic8bT
 W0BXK4oYuqids85YDtS6UIJVrmAyW3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639554991;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpZnTgfJAKDwFgGdEnzMi1mhx1eA2KNlH7kbVFZA4D0=;
 b=Ak4wlh7QH63Qf9VRmqfhFmquNF1cWWo+VeT/snzXm77AqugOH+WFMIzPuXOL8IU6i/GFNE
 coIU+DjR/JwBoYCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E454813A9F;
 Wed, 15 Dec 2021 07:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I9e6NK6fuWF/JwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Dec 2021 07:56:30 +0000
Date: Wed, 15 Dec 2021 08:56:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] Move the libssh setup from configure to meson.build
Message-ID: <YbmfrUfBK4/H75BI@pevik>
References: <20211209144801.148388-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209144801.148388-1-thuth@redhat.com>
Received-SPF: pass client-ip=195.135.220.28; envelope-from=pvorel@suse.cz;
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Although it's probably too late, as I see patch with PULL [1].

Kind regards,
Petr

[1] https://lore.kernel.org/qemu-devel/20211215073402.144286-10-thuth@redhat.com/

