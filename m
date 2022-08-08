Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1F58CAB1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:48:24 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL43I-0003W5-EJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oL40y-0001xe-TI
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:45:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oL40w-0003Ke-2q
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:45:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q30so11126885wra.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=LirsAiipfXb+QWMHSbcKE6U5374CRC2uE46mpJ53z9A=;
 b=WfSXXXW2w2YDmuEk/EUN/y3LICiaO+8APaw2fI4U68c0+FyJF5nJzDH4pkAOxiw2Y5
 qBdk2AmsB9xoVcf8vPjaCTR5oOsVXWIAS8u1VvNM85BPGhZ4MJ6gJw2uejxV6/2DVvvc
 PQhWPAdx8pArfYZb+O70hjtVzKf3HsvRrhR7I92TD5bIJTBa1cLKqF4wh+4nkGVOxxA9
 qoyjLZVEBO/u395MNxy/gTmwQqHKnz4nbSAZuzpAlXVBNtLRQttKRusFLtEQTrJikagH
 ZMODitNZ4JVtNpM+7Xgh6D970FQZBXOqU+aECcWaz1GEQjpiNCkjdaCcPXnzNlTOzbJJ
 6aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=LirsAiipfXb+QWMHSbcKE6U5374CRC2uE46mpJ53z9A=;
 b=ZUT66CBYOtqHdkTLIkuoEoVR6nx9uF7GsYm6v05vTsUvEva3DcB93m+MUyFm2rgjVu
 qXjfxrK+AInIgeLjmLeEUJ5Ev/QkdkdurcaWVqrM3S0EQc6tmK9Nn0UNgZaE+HcqhC89
 pP+AneSvcEUCZkSuFGvhGjprTjmDg2lgpCBH8rJcKhrkc2WZEgofjQxuShWmzxbJVwqq
 wgRJ7qtzjUPQzS6Fq1lr91zXc2kjQNXrRyc70BfjsnpSf6XG2S9ChSaQ1T6hWwaVcmVM
 SN4Q2UvAadLjVTMKISk9VeLcRBoTCcyhPvFRo18SuSxHvdTNelU5cZPFv0fyQcNIuPw8
 Eszw==
X-Gm-Message-State: ACgBeo3JUIwuFsLziOtofo2wQm7ib92tiUqKNJO5XaVlLkA7h+pmrC4Q
 oqqxG2vxQW+ygQtMM1DIuxs0Cw==
X-Google-Smtp-Source: AA6agR5fCiXRiope2TrKTZ9DpW8+oFeUhHRTIz2fRK0pYUITFFr43wNW+EztZubwUOC30RkyhHIEAA==
X-Received: by 2002:a5d:560d:0:b0:21f:1619:ba0 with SMTP id
 l13-20020a5d560d000000b0021f16190ba0mr11599904wrv.318.1659969951925; 
 Mon, 08 Aug 2022 07:45:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c424300b003a53de38c0dsm4912645wmm.14.2022.08.08.07.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 07:45:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 613861FFB7;
 Mon,  8 Aug 2022 15:45:50 +0100 (BST)
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev> <87wncx2xw4.fsf@pond.sub.org>
 <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
 <20220727172759.GA30765@raphael-debian-dev>
 <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, Markus Armbruster
 <armbru@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Date: Mon, 08 Aug 2022 15:37:19 +0100
In-reply-to: <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
Message-ID: <87czdaoktd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 27 Jul 2022 at 18:28, Raphael Norwitz
> <raphael.norwitz@nutanix.com> wrote:
>>
>> On Tue, Jul 26, 2022 at 03:57:42PM +0100, Peter Maydell wrote:
>> > On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wro=
te:
>> > > Could we use a contrib/README with an explanation what "contrib" mea=
ns,
>> > > and how to build and use the stuff there?
>> >
>> > I would rather we got rid of contrib/ entirely. Our git repo
>> > should contain things we care about enough to really support
>> > and believe in, in which case they should be in top level
>> > directories matching what they are (eg tools/). If we don't
>> > believe in these things enough to really support them, then
>> > we should drop them, and let those who do care maintain them
>> > as out-of-tree tools if they like.
>> >
>>
>> I can't speak for a lot of stuff in contrib/ but I find the vhost-user
>> backends like vhost-user-blk and vhost-user-scsi helpful for testing and
>> development. I would like to keep maintaining those two at least.
>
> Right, I don't mean we should just delete contrib/, but for the
> things currently in it that we do care about, we should define
> what their relationship to QEMU is and put them in a part of
> the source tree that says what they actually are. contrib/
> just means "nobody thought about it".

I split plugins a while ago between:

  tests/plugin
  contrib/plugins

where the former are really basic plugins that show usage, exercise the
API and are included in the check-tcg tests. The contrib plugins are
slightly more random mix of useful (e.g. cache, execlog), downright
experimental (lockstep) and stuff I can't actually test (e.g. drcov).

I'll quite happily continue to process patches that update and enhance
contrib/plugins but at a push a few could be promoted to less of a
dumping ground (tools/tcg-plugins?).

I guess it would only really matter if we were installing plugins as
part of "make install"?

--=20
Alex Benn=C3=A9e

