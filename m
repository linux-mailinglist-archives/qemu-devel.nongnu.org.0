Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3E3B18C9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:24:28 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0zb-00031d-Cq
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lw0yY-0001rB-NT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:23:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lw0yW-0001d2-Nc
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:23:22 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 163B021966;
 Wed, 23 Jun 2021 11:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624447398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us7sprk2XBxnMwx4k9ljJE4hsU6edysBMDxCSrPyFXM=;
 b=kP+iOk5Wt4AYVV9mryFxxhwI7Kt5dtRVlB6bHBKH7z3aS4rlh8t7LpQbyNQDhEWUEG9wCF
 g40YH3ZvtUZj2MDuXSCBwhr1DV9gxv6l0NY7w8DtAJNiCZAOsLlg/AzJTLSTRcJcIit3Bc
 CkF7lds2TiJcYXZMGbLwu/78a065I2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624447398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us7sprk2XBxnMwx4k9ljJE4hsU6edysBMDxCSrPyFXM=;
 b=d1oHZ40lknHl6ciZd6AZhRuiy7mU9zsy+Cc4nbxwsp4eQ2pV+jXhWAyU3HnlxdTN4AXll3
 sXmTXaBCgb5YJdCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E582411A97;
 Wed, 23 Jun 2021 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624447398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us7sprk2XBxnMwx4k9ljJE4hsU6edysBMDxCSrPyFXM=;
 b=kP+iOk5Wt4AYVV9mryFxxhwI7Kt5dtRVlB6bHBKH7z3aS4rlh8t7LpQbyNQDhEWUEG9wCF
 g40YH3ZvtUZj2MDuXSCBwhr1DV9gxv6l0NY7w8DtAJNiCZAOsLlg/AzJTLSTRcJcIit3Bc
 CkF7lds2TiJcYXZMGbLwu/78a065I2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624447398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Us7sprk2XBxnMwx4k9ljJE4hsU6edysBMDxCSrPyFXM=;
 b=d1oHZ40lknHl6ciZd6AZhRuiy7mU9zsy+Cc4nbxwsp4eQ2pV+jXhWAyU3HnlxdTN4AXll3
 sXmTXaBCgb5YJdCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2hAhN6UZ02BIdwAALh3uQQ
 (envelope-from <msuchanek@suse.de>); Wed, 23 Jun 2021 11:23:17 +0000
Date: Wed, 23 Jun 2021 13:23:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Regarding commit a9bcedd (SD card size has to be power of 2)
Message-ID: <20210623112316.GY8544@kitsune.suse.cz>
References: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
 <YNL+19TnvDzK5NNh@redhat.com>
 <eb606b89-5c12-8502-aa64-fafdeeb7bae0@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb606b89-5c12-8502-aa64-fafdeeb7bae0@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=195.135.220.28; envelope-from=msuchanek@suse.de;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 12:59:45PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 6/23/21 11:28 AM, Daniel P. Berrangé wrote:
> > On Mon, Jun 07, 2021 at 04:29:54PM +0800, Tom Yan wrote:
> >> Hi philmd (and others),
> >>
> >> So I just noticed your commit of requiring the size of an emulated SD
> >> card to be a power of 2, when I was trying to emulate one for an
> >> actual one (well, it's a microSD, but still), as it errored out.
> >>
> >> You claim that the kernel will consider it to be a firmware bug and
> >> "correct" the capacity by rounding it up. Could you provide a concrete
> >> reference to the code that does such a thing? I'm not ruling out that
> >> some crazy code could have gone upstream because some reviewers might
> >> not be doing their job right, but if that really happened, it's a
> >> kernel bug/regression and qemu should not do an equally-crazy thing to
> >> "fix" it.
> > 
> > I looked back at the original threads for details, but didn't
> > find any aside from this short message saying it broke Linux:
> > 
> >   https://www.mail-archive.com/qemu-devel@nongnu.org/msg720737.html
> > 
> > Philippe, do you have more details on the problem hit, or pointer
> > to where the power-of-2 restriction is in Linux ?
> 
> Sorry for not responding soon enough, too many things.
> 
> I wrote patches to address Tom's problem, but couldn't fix all
> the cases yet. So far the problem is not Linux but firmwares
> announcing pow2 to Linux without checking card layout.
> 
> It is hard to make everybody happy, security users and odd firmwares.
> 
> I came out with a larger series to be able to classify QEMU API /
> devices code as security sensible or not, and use of some unsafe
> API to taint some security mode (so far only displaying a warning).
> If the security mode is tainted (use of unsafe device, unsafe config,
> unsafe feature), then users shouldn't expect safety in the guest.
> 
> That way I could have classified the SD card model as unsafe and not
> bothered various users by restricting to pow2 card sizes.
> 
> >> No offense but what you claimed really sounds absurd and ridiculous.
> >> Although I don't have hundreds of SD cards in hand, I owned quite a
> >> few at least, like most people do, with capacities ranging from ~2G to
> >> ~128G, and I don't even recall seeing a single one that has the
> >> capacity being a power of 2. (Just like vendors of HDDs and SSDs, they
> >> literally never do that AFAICT, for whatever reasons.)
> > 
> > Yes, this does feel pretty odd to me too, based on the real physical
> > SD cards I've used with Linux non-power-2 sizes.
> > 
> > Also in general QEMU shouldn't be enforcing restrictions based on
> > guest behaviour, it should follow the hardware specs. If the
> > hardware spec doesn't mandate power-of-2 sizes, then QEMU shoud
> > not require that, even if some guest OS has added an artificial
> > restriction of its own.
> 
> The comment is misleading, the restriction was to answer CVE vuln.

Care to share the reference?

I would be really interested in the piece of software that relies on
power of two sized SD cards to be secure. Sounds like it's broken and
should be fixed rather than worked around in qemu.

It also means that on real hardware that lacks power of two sized SD
cards it is always insecure.

Thanks

Michal

