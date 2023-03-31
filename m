Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F66D27AC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 20:20:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piJKp-0005NB-Jb; Fri, 31 Mar 2023 14:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piJKn-0005Mi-76
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 14:18:45 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piJKl-0004DG-3Y
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 14:18:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AD1F21AB9;
 Fri, 31 Mar 2023 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680286720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VyoUjI5x2cDEA0LAcY16AlwyMdL4rAeAITz150AIsw=;
 b=BeNaKRlfF57oIbGf9LMmuZt+XvYqLsWFKC2hr/54jBkscmUr0Fj+VqDFaos3ZCAVs/UzBL
 pNF5waBGGuFgyBEosYGz8epaJRGruq2Grz9B8FLdwf50INvk+I4h7QRWFhSZEvucPbonjJ
 Lbc+jQ6CBBJUpTBoh526Yqjh6I5/Q+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680286720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VyoUjI5x2cDEA0LAcY16AlwyMdL4rAeAITz150AIsw=;
 b=4udA8UHN6wrEO7MNftuhWd9p9X/Hy2WXdTa931ngrynAxENj5AwgJPglAABdS5bq066IY5
 EIh5ulcZE8LH59Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B928D133B6;
 Fri, 31 Mar 2023 18:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ft18H/8jJ2QKVwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 18:18:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Xu <peterx@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com, Juan Quintela
 <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
In-Reply-To: <ZCcKBDM9sLomGOQE@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com>
 <ZCcKBDM9sLomGOQE@x1n>
Date: Fri, 31 Mar 2023 15:18:37 -0300
Message-ID: <875yagpywy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Peter Xu <peterx@redhat.com> writes:

> On Fri, Mar 31, 2023 at 05:10:16PM +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
>> > On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
>> > > Peter Xu <peterx@redhat.com> writes:
>> > >=20
>> > > > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
>> > > >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
>> > > >> >>=20
>> > > >> >> - Single migration runs of stopped 32G guest with ~90% RAM usa=
ge. Guest
>> > > >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --v=
erify -t
>> > > >> >>   10m -v`:
>> > > >> >>=20
>> > > >> >> migration type  | MB/s | pages/s |  ms
>> > > >> >> ----------------+------+---------+------
>> > > >> >> savevm io_uring |  434 |  102294 | 71473
>> > > >> >
>> > > >> > So I assume this is the non-live migration scenario.  Could you=
 explain
>> > > >> > what does io_uring mean here?
>> > > >> >
>> > > >>=20
>> > > >> This table is all non-live migration. This particular line is a s=
napshot
>> > > >> (hmp_savevm->save_snapshot). I thought it could be relevant becau=
se it
>> > > >> is another way by which we write RAM into disk.
>> > > >
>> > > > I see, so if all non-live that explains, because I was curious wha=
t's the
>> > > > relationship between this feature and the live snapshot that QEMU =
also
>> > > > supports.
>> > > >
>> > > > I also don't immediately see why savevm will be much slower, do yo=
u have an
>> > > > answer?  Maybe it's somewhere but I just overlooked..
>> > > >
>> > >=20
>> > > I don't have a concrete answer. I could take a jab and maybe blame t=
he
>> > > extra memcpy for the buffer in QEMUFile? Or perhaps an unintended ef=
fect
>> > > of bandwidth limits?
>> >=20
>> > IMHO it would be great if this can be investigated and reasons provide=
d in
>> > the next cover letter.
>> >=20
>> > >=20
>> > > > IIUC this is "vm suspend" case, so there's an extra benefit knowle=
dge of
>> > > > "we can stop the VM".  It smells slightly weird to build this on t=
op of
>> > > > "migrate" from that pov, rather than "savevm", though.  Any though=
ts on
>> > > > this aspect (on why not building this on top of "savevm")?
>> > > >
>> > >=20
>> > > I share the same perception. I have done initial experiments with
>> > > savevm, but I decided to carry on the work that was already started =
by
>> > > others because my understanding of the problem was yet incomplete.
>> > >=20
>> > > One point that has been raised is that the fixed-ram format alone do=
es
>> > > not bring that many performance improvements. So we'll need
>> > > multi-threading and direct-io on top of it. Re-using multifd
>> > > infrastructure seems like it could be a good idea.
>> >=20
>> > The thing is IMHO concurrency is not as hard if VM stopped, and when w=
e're
>> > 100% sure locally on where the page will go.
>>=20
>> We shouldn't assume the VM is stopped though. When saving to the file
>> the VM may still be active. The fixed-ram format lets us re-write the
>> same memory location on disk multiple times in this case, thus avoiding
>> growth of the file size.
>
> Before discussing on reusing multifd below, now I have a major confusing =
on
> the use case of the feature..
>
> The question is whether we would like to stop the VM after fixed-ram
> migration completes.  I'm asking because:
>

We would.

>   1. If it will stop, then it looks like a "VM suspend" to me. If so, cou=
ld
>      anyone help explain why we don't stop the VM first then migrate?
>      Because it avoids copying single pages multiple times, no fiddling
>      with dirty tracking at all - we just don't ever track anything.  In
>      short, we'll stop the VM anyway, then why not stop it slightly
>      earlier?
>

Looking at the previous discussions I don't see explicit mentions of a
requirement either way (stop before or stop after). I agree it makes
more sense to stop the guest first and then migrate without having to
deal with dirty pages.

I presume libvirt just migrates without altering the guest run state so
we implemented this to work in both scenarios. But even then, it seems
QEMU could store the current VM state, stop it, migrate and restore the
state on the destination.

I might be missing context here since I wasn't around when this work
started. Someone correct me if I'm wrong please.

>   2. If it will not stop, then it's "VM live snapshot" to me.  We have
>      that, aren't we?  That's more efficient because it'll wr-protect all
>      guest pages, any write triggers a CoW and we only copy the guest pag=
es
>      once and for all.
>
> Either way to go, there's no need to copy any page more than once.  Did I
> miss anything perhaps very important?
>
> I would guess it's option (1) above, because it seems we don't snapshot t=
he
> disk alongside.  But I am really not sure now..
>

