Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9774D8C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:27:23 +0100 (CET)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqLi-0000Ln-9o
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:27:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTqHi-0000nb-LN
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:23:14 -0400
Received: from [2a00:1450:4864:20::529] (port=41817
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTqHh-0007po-1k
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:23:14 -0400
Received: by mail-ed1-x529.google.com with SMTP id c20so21330792edr.8
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vwsEf23SGv9uU5Z5WKKS3nYhdclo4TxJUctKhcssOgU=;
 b=qvTNjBOvKwjtOKZE7TV+144NPqDHMdIuTMR2L4vLzrDFbF50W8MgId7xWklR7gQ7ee
 m1QhfAaSvZnLn66ax1xooADuhGrNNgCne1BBid6u3Gh0LdRB3DCFqDiSzHPBkvSQU7/1
 ARfBXBv6cFzOjaWh+JerzOI2v5WTvgqMRdwX3XRYHJOQ/bMo0EPsBvdMJlCcZ2qiedRE
 03E/08n9fH/SPMmg8wDKXE3wezITjh0Ku7x2GHRQJxOB28dnC8WtnI6ZBWinc58SZVuy
 SMn1h1Gw/QOgZrbW+ApQnfN+ZY7XwXBwNNPCZU9vR3Re+TkWn2jpxFHrOTbRTUk37cfE
 AgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vwsEf23SGv9uU5Z5WKKS3nYhdclo4TxJUctKhcssOgU=;
 b=BNE3JyP+StdRni5Z8iSBcW4Erw1dq9WxKUW5+myk+pMLFJ4GM8popyZCetnizxGdOZ
 NAw1vm3t3iDwWCZcHL6u3Ofstbf8oyxz1PMjRPWK90Ku4LDV9dTdepxcxc+SGyEfBr74
 7K/6r8ZUpWOTwsXqx38okVVKwP1JosH2d8pVEvH3413JAn7KVl1yt77KbBPtVFkGrYML
 x/jxqwwCKzedLyV8ncaxwRUnHcXri4Clxy0Zasjiw5JL9AQekbZEJq6IndeeUTYjkFnZ
 Hrp/FHAWG/ttKkSUzV5QOCFmJyGbqF7E4nm4mCf0UiEsG/KXmVyUibMX3dHSyXK+aLxQ
 mzmw==
X-Gm-Message-State: AOAM530SxSI+vKj+NZKmx4NkY9ObcQCZSWCAREZ17k9chRTOrVpmX85K
 vsnv2yMN1uxD4c9qN3W/tmnPJw==
X-Google-Smtp-Source: ABdhPJxcq//GLw34w34R/ZbAznfxC0Uo39AL2FcFmtAlAOmZNvx3LMgnwn1d/9NJkypRc95UVUwxTA==
X-Received: by 2002:a05:6402:b42:b0:415:e6e7:65aa with SMTP id
 bx2-20020a0564020b4200b00415e6e765aamr21292242edb.105.1647285791693; 
 Mon, 14 Mar 2022 12:23:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 sa13-20020a1709076d0d00b006ce3ef8e1d4sm7068524ejc.31.2022.03.14.12.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 12:23:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 117581FFB7;
 Mon, 14 Mar 2022 19:23:10 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-3-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes
 obvious sense
Date: Mon, 14 Mar 2022 19:23:04 +0000
In-reply-to: <20220314160108.1440470-3-armbru@redhat.com>
Message-ID: <87ee345of5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>
> Patch created mechanically with:
>
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
>
> Except this uncovers a typing error:
>
>     ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning=
 to 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types]
> 	    val =3D g_new0(QppEntry, 1);
> 		^ ~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>
> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> QpfEntry instead.
>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

