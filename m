Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29AB6EF158
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 11:43:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prbfx-0004n0-IP; Wed, 26 Apr 2023 05:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prbfu-0004l3-UV
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prbft-00012K-0P
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682502175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+u28ZktbBC/+IXlVB0gLtHvbCFgKyD9ChyR5x/+acHk=;
 b=HQo0J0RpB2/mtOs+WwceTSD0c1SH3TkpW0dOICdLF1U6Vg1qeJtiNqBogz8DdhY6StyMDV
 6x/jOFNK+MsWpY9CScIVAuenY5/Uv0mwQ2DH0DDmeXIcFplN1gQDgnoPOPkiaOJet1Udn9
 065lSTUVOvP6FgIQhcGCi8isyMJHajo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-QOG6fTBXMtKXZwyZT5lUgg-1; Wed, 26 Apr 2023 05:42:54 -0400
X-MC-Unique: QOG6fTBXMtKXZwyZT5lUgg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f92bd71f32so2237057f8f.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 02:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682502173; x=1685094173;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+u28ZktbBC/+IXlVB0gLtHvbCFgKyD9ChyR5x/+acHk=;
 b=RZO3xkdrdXQj0NtGI1UMhfqs1H1GrZR1Of/zybksr0wZne77TQWDUiiDIotGrica/D
 KuJ6oq9LJnr9+xrX7GyCejRx7/cx5bEwMAIYmPKtYe+Xgi5J4lSZvgWNELZgHAZZPE/e
 X0x4odzRLXJkdiraRcXeHeTCkRauKN+L9cTui7qsIOPRRNXIxKXXfE3K9KXyxaZcEQvu
 KPDLGhnfZv63ms+g1Fb68GA5frpF03/bwrqP1AH/nAR3ygaEpKNGgr5fO1Y1uT0jd4Sf
 hoYiJT23N2KQvubUFnpxwUsF2IP2LqIx4dvl5vjEZcN+AyKbJ8KrX8D0gJ+r8I4C5Jmn
 yt2w==
X-Gm-Message-State: AAQBX9dQolaG7+RSkZmyfpxfCCHgyJROKtITWfttkO4TZnBStZdT/1NQ
 QY3ZTTZxB3YsYCe4nl+ZvENd9ascr8vWQm8pwEspkC/eA4/RzZ+UqMGKpHa3vYymwtxQLBNwejL
 OYSSkeb7tvO5S31Y=
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr7967405wrz.53.1682502173005; 
 Wed, 26 Apr 2023 02:42:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350ae6uJ1bvp6oIrh20uR5Ruv7/ZaPCzfYlBTB6ADHIrSsMkX7XiSWxLE205nkVdRSW6E6u11ng==
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr7967390wrz.53.1682502172692; 
 Wed, 26 Apr 2023 02:42:52 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b002f6962ee703sm15293553wrq.61.2023.04.26.02.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 02:42:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Zhang Chen <chen.zhang@intel.com>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH v2 2/6] tests/qtests: remove migration test iterations
 config
In-Reply-To: <ZEjp1o9lGfQFXNZG@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 26 Apr 2023 10:07:34 +0100")
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-3-berrange@redhat.com>
 <87r0scgats.fsf@secure.mitica> <ZEjp1o9lGfQFXNZG@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 11:42:51 +0200
Message-ID: <871qk7gesk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Fri, Apr 21, 2023 at 11:54:55PM +0200, Juan Quintela wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> > The 'unsigned int interations' config for migration is somewhat
>> > overkill. Most tests don't set it, and a value of '0' is treated
>> > as equivalent to '1'. The only test that does set it, xbzrle,
>> > used a value of '2'.
>> >
>> > This setting, however, only relates to the migration iterations
>> > that take place prior to allowing convergence. IOW, on top of
>> > this iteration count, there is always at least 1 further migration
>> > iteration done to deal with pages that are dirtied during the
>> > previous iteration(s).
>> >
>> > IOW, even with iterations=3D=3D1, the xbzrle test will be running for
>> > a minimum of 2 iterations. With this in mind we can simplify the
>> > code and just get rid of the special case.
>>=20
>> Perhaps the old code was already wrong, but we need at least three
>> iterations for the xbzrle test:
>> - 1st iteration: xbzrle is not used, nothing is on cache.
>
> Are you sure about this ?  I see ram_save_page() calling
> save_xbzrle_page() and unless I'm mis-understanding the
> code, it doesn't appear to skip anything on the 1st
> iteration.

I will admit that code is convoluted as hell.
And I confuse myself a lot here O:-)

struct RAM_STATE {
    ...
    /* Start using XBZRLE (e.g., after the first round). */
    bool xbzrle_enabled;
}

I.e. xbzrle_enabled() and m->xbzrle_enabled are two completely different th=
ings.

static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
{
    ...
    if (rs->xbzrle_enabled && !migration_in_postcopy()) {
        pages =3D save_xbzrle_page(rs, pss, &p, current_addr,
                                 block, offset);
        ....
    }
    ....
}

and

static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
{
    /* Update pss->page for the next dirty bit in ramblock */
    pss_find_next_dirty(pss);

    if (pss->complete_round && pss->block =3D=3D rs->last_seen_block &&
        ...
        return PAGE_ALL_CLEAN;
    }
    if (!offset_in_ramblock(pss->block,
                            ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
        ....
        if (!pss->block) {
            ....
            if (migrate_use_xbzrle()) {
                rs->xbzrle_enabled =3D true;
            }
        }
        ...
    } else {
        /* We've found something */
        return PAGE_DIRTY_FOUND;
    }
}



> IIUC save_xbzrle_page will add pages into the cache on
> the first iteration, so the second iteration will get
> cache hits
>
>> - 2nd iteration: pages are put into cache, no xbzrle is used because
>>   there is no previous page.
>> - 3rd iteration: We really use xbzrle now against the copy of the
>>   previous iterations.
>>=20
>> And yes, this should be commented somewhere.

Seeing that it has been able to confuse you, a single comment will not
make the trick O:-)

Later, Juan.


