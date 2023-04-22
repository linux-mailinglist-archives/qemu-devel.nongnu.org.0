Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89D6EB837
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 11:23:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq9R3-0002uN-AJ; Sat, 22 Apr 2023 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pq9R1-0002tn-2U
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 05:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pq9Qy-0007K9-Jz
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 05:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682155291;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G25TvIPXt9pngmcLfm0nIIEmCnSDabI/Cz8cC64R84w=;
 b=CRPy77KmTmATKAzz9iIEEF0wQinqD8QcF6Hoy+ofg4wmpT2wBmOr2nHheebSD0Py1xmiim
 mGlS+8cOGIIX4edjDkE44gPylLayYApS+JPAkLlQoVZaPY24G3sNGmHuYLbGN0Sp/c92iC
 1OeCzAYdPLW7B6tXVTiTPl5fKkb5t7o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-vAnvcv2mOQuOG5Ht6-kNCg-1; Sat, 22 Apr 2023 05:21:30 -0400
X-MC-Unique: vAnvcv2mOQuOG5Ht6-kNCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so14615755e9.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 02:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682155288; x=1684747288;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G25TvIPXt9pngmcLfm0nIIEmCnSDabI/Cz8cC64R84w=;
 b=FAHDxf0KUmGn3lFUVbW2A5om6koiO8eGKQNSFge6exZTrrWH2vQz5UFj1tjIMeEdGH
 rLmwrf1F/pCUGMEePtPrW9r0ciadP7kVrXKVrRl5DNigy8g2q0tc9XSkJBO34ST/gZVx
 ymRR3WE3CsHQNZW0H/9v/hEtUacJM0u+D2QE+1Cw+kJKzvSvWMNZJ65+lLfwIKTtwHl8
 4CLqOlmjN4JLags5RYDKIflpWaI93rXX7A1Q1QgkY40jR+yNjpwEt1tCLr9yBYJQX3F4
 LDhrdnynH87I6KBe54unl64Gmm1wq3njBFRmFWSethxFNWS5J9+vV9rmotxaDHBPjKVw
 gyAA==
X-Gm-Message-State: AAQBX9fNeWzcJQdHnTJhJVMWmQ/rwxGmTjjPllvE1I3sVRpDM9ZX3+8x
 uMYvgiS7FRsx5QIVZhru/yXaqH3+zVZunqGE/SxE7jGeEylpeKGQqv7aYx9u5GeO6oBIZWeB0GR
 khapt6TqN3NmE844=
X-Received: by 2002:a1c:f714:0:b0:3f0:4428:9444 with SMTP id
 v20-20020a1cf714000000b003f044289444mr3770080wmh.10.1682155287895; 
 Sat, 22 Apr 2023 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350a79zKeAkDEP93PU8cjc1YR5tMnR0dynuLXOQl9s3ThHESHV1sz3AE/hyOyjw5ZJuUiauv1NA==
X-Received: by 2002:a1c:f714:0:b0:3f0:4428:9444 with SMTP id
 v20-20020a1cf714000000b003f044289444mr3770069wmh.10.1682155287549; 
 Sat, 22 Apr 2023 02:21:27 -0700 (PDT)
Received: from redhat.com ([31.4.177.125]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c46ca00b003f1957ace1fsm2889734wmo.13.2023.04.22.02.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 02:21:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/20] Migration 20230420 patches
In-Reply-To: <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org> (Richard
 Henderson's message of "Sat, 22 Apr 2023 06:09:04 +0100")
References: <20230420131751.28534-1-quintela@redhat.com>
 <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 22 Apr 2023 11:21:20 +0200
Message-ID: <87y1mke0hb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 4/20/23 14:17, Juan Quintela wrote:
>> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb=
598:
>>    Open 8.1 development tree (2023-04-20 10:05:25 +0100)
>> are available in the Git repository at:
>>    https://gitlab.com/juan.quintela/qemu.git
>> tags/migration-20230420-pull-request
>> for you to fetch changes up to
>> cdf07846e6fe07a2e20c93eed5902114dc1d3dcf:
>>    migration: Pass migrate_caps_check() the old and new caps
>> (2023-04-20 15:10:58 +0200)
>> ----------------------------------------------------------------
>> Migration Pull request
>> This series include everything reviewed for migration:
>> - fix for disk stop/start (eric)
>> - detect filesystem of hostmem (peter)
>> - rename qatomic_mb_read (paolo)
>> - whitespace cleanup (=E6=9D=8E=E7=9A=86=E4=BF=8A)
>>    I hope copy and paste work for the name O:-)
>> - atomic_counters series (juan)
>> - two first patches of capabilities (juan)
>> Please apply,
>
> Fails CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/4159279870#L2896
>
> /usr/lib/gcc-cross/mipsel-linux-gnu/10/../../../../mipsel-linux-gnu/bin/l=
d:
> libcommon.fa.p/migration_migration.c.o: undefined reference to symbol
> '__atomic_load_8@@LIBATOMIC_1.0'

Hi Richard

First of all, I have no doubt that you know better that me in this
regard (*).

Once told that, it looks like one case of "my toolchain is better than
yours":

$ ls qemu-system-mips
qemu-system-mips        qemu-system-mips64el.p/ qemu-system-mipsel.p/
qemu-system-mips64      qemu-system-mips64.p/   qemu-system-mips.p/
qemu-system-mips64el    qemu-system-mipsel

This is Fedora37 with updates.

There are two posibilities here that came to mind, in order of
probability;
- myself with:

-    if (ram_counters.dirty_pages_rate && transferred > 10000) {
+    if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
+        transferred > 10000) {

- paolo:

 PostcopyState  postcopy_state_get(void)
 {
-    return qatomic_mb_read(&incoming_postcopy_state);
+    return qatomic_load_acquire(&incoming_postcopy_state);
 }

> You're using an atomic 8-byte operation on a host that doesn't support
> it.  Did you use qatomic_read__nocheck instead of qatomic_read to try
> and get around a build failure on i686?  The check is there for a
> reason...

No, I am changing all ram_counters values to atomic.  Almost all of them
move from [u]int64_t to Stat64.  Notice that I don't care about 63 to
64bits, and anyways I think it was an error that they were int64_t on
the frist place (blame the old days qapi whet it didn't have unsigned
types).

But it don't exist a stat64_set() function.  The most similar thing that
appears here is stat64_init(), but it is cheating about not being atomic
at all.

Almost all ram_counters values are ok with stat64_add() and stat64_get()
operations.  But some of them, we need to reset them to zero (or
someother value, but that would not be complicated).

(*) And here is where it comes the call sentence from the 1st paragraph,
see how the stat64_get() gets implemented for the !CONFIG_ATOMIC64, I
didn't even try to write a stat64_set() on my own.

This is one example of the use that I had:

     if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
         transferred > 10000) {
-        s->expected_downtime =3D ram_counters.remaining / bandwidth;
+        s->expected_downtime =3D
+            qatomic_read__nocheck(&ram_counters.dirty_bytes_last_sync) /
+                                  bandwidth;
     }
=20
     qemu_file_reset_rate_limit(s->to_dst_file);
diff --git a/migration/ram.c b/migration/ram.c
index 7400abf5e1..7bbaf8cd86 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1224,7 +1224,8 @@ static void migration_bitmap_sync(RAMState *rs)
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(rs, block);
         }
-        ram_counters.remaining =3D ram_bytes_remaining();
+        qatomic_set__nocheck(&ram_counters.dirty_bytes_last_sync,
+                             ram_bytes_remaining());
:


and why I used qatomic_*__nocheck() instead of the proper operations?
Because reading this:

#define qatomic_read__nocheck(ptr) \
    __atomic_load_n(ptr, __ATOMIC_RELAXED)

#define qatomic_read(ptr)                              \
    ({                                                 \
    qemu_build_assert(sizeof(*ptr) <=3D ATOMIC_REG_SIZE); \
    qatomic_read__nocheck(ptr);                        \
    })

#define qatomic_set__nocheck(ptr, i) \
    __atomic_store_n(ptr, i, __ATOMIC_RELAXED)

#define qatomic_set(ptr, i)  do {                      \
    qemu_build_assert(sizeof(*ptr) <=3D ATOMIC_REG_SIZE); \
    qatomic_set__nocheck(ptr, i);                      \
} while(0)

I was complely sure that we will never get the qemu_build_assert().

I know, I know.

And now that I have explained myself, what is the correct way of doing
this?

I declared the value as:

+    aligned_uint64_t dirty_bytes_last_sync;
-    int64_t remaining;

I just want to make sure that *all* ram_counters are atomic and then I
can use them from any thread.  All the counters that use stat64 already
are.  But for this two to work, I would need to have a way to set and
old value.

And once that we are here, I would like ta have:

stat64_inc(): just add 1, I know, I can create a macro.

and

stat64_reset(): as its name says, it returns the value to zero.

I still miss a couple of stats in migration, where I need to reset them
to zero from time to time:

./ram.c:380:    uint64_t bytes_xfer_prev;
./ram.c:747:    rs->bytes_xfer_prev =3D stat64_get(&ram_counters.transferre=
d);
./ram.c:1183:        stat64_get(&ram_counters.transferred) - rs->bytes_xfer=
_prev;
./ram.c:1247:        rs->bytes_xfer_prev =3D stat64_get(&ram_counters.trans=
ferred);

You can clame that this operation happens always on the migration
thread, but I have found that it is more difficult to document which
ones are atomic and which not, that make all of them atomic.  This
variable are get/set once a second, so performance is not one of the
issues.

And:

./ram.c:382:    uint64_t num_dirty_pages_period;
./ram.c:746:    rs->num_dirty_pages_period =3D 0;
./ram.c:1095:    rs->num_dirty_pages_period +=3D new_dirty_pages;
./ram.c:1133:                         rs->num_dirty_pages_period * 1000 /
./ram.c:1184:    uint64_t bytes_dirty_period =3D rs->num_dirty_pages_period=
 * TARGET_PAGE_SIZE;
./ram.c:1232:    trace_migration_bitmap_sync_end(rs->num_dirty_pages_period=
);
./ram.c:1246:        rs->num_dirty_pages_period =3D 0;

The problem here is that we reset the value every second, but for
everything else it is an stat64.

Thanks, Juan.


