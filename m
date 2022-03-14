Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9735D4D8DF8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:12:29 +0100 (CET)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTr3M-00047x-O6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:12:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTr0u-0001Yx-9x
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:09:56 -0400
Received: from [2a00:1450:4864:20::532] (port=34626
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTr0r-00069b-2d
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:09:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id g3so21556080edu.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TyjIR8cu39wafofM+zk55pMOkvXNU/TH+17qM8XX/mo=;
 b=bXMVXacOlW6oQtjRy6EEwOPK02lVKTTyd6/63WJ9myEU1O9NELNBNQFwJwnU1Q+IV4
 a78TJqmzB0yQV61DcsiteBFtBrYAxi4UyScHw46RQ01k7cch+G5Ewh1QQePtNuyWlHgn
 vzFykmfP7UPG0DGfUPYpQGUs3MPI/Uz7x8ZBLCOnfYh841aN/yYy991ZkoY8y96vevQT
 rYgPvCHsucOivuwXVbuFg8WfMPJoEnRA0iEIV6Ki9rvqrDNfEdtjhtuyFT6UDnYOPX1z
 T77pzcl0RkLg4VymdgVZj8xTOFCCNeA8qOc10IeoZnUENHsGsyVB5/919v10tE9Dn4b+
 YYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TyjIR8cu39wafofM+zk55pMOkvXNU/TH+17qM8XX/mo=;
 b=ryEXFw/BdqY3ON9Ac/r2p/ILNtJr5LwyXtO+5GkyNW2saKSdL5Z85+vbpNgkJjniE0
 nLRjkEX7WrjaOyx9iMKFd0Eav9vLakdNqeI+Im4OvoKOer8jyWFnjDAH4To0cEVMPDvW
 c6tDy4iDe91pBZ2QcQxBgIX/b/bnVl4ImGy3gmC0btsmUAExrNU1+vIeGhkQS13QBTGc
 jz4TQhhi/YgzVF+PHDuycL5ZUjFT1HKr3Bi/PMzkf1KWOdLYg/kFO52/15vH0BJ1GMRO
 OaeMrbmEUYTTjDi5u3IiuZ+hCO5wNI8sEoQ5qKgzPmHjdnWdZvkR4u5GI/idj7bBKGMO
 9pEg==
X-Gm-Message-State: AOAM531ilAnJyAFfjMR0Du62vGpZpZ3CXDK/OTAbvqE38TDw8TEBRjX5
 BM6kymduff8rvDRGu+EmzeEFMg==
X-Google-Smtp-Source: ABdhPJzoiP+70QZTfjJbS19fTL4Aqo4JVXWpmjHO/0lg4tfXpYs79y9/OcB3nK2PUGv+/u/9Tt6Yvg==
X-Received: by 2002:a05:6402:d08:b0:418:82ff:5aae with SMTP id
 eb8-20020a0564020d0800b0041882ff5aaemr6605923edb.400.1647288591372; 
 Mon, 14 Mar 2022 13:09:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 rv11-20020a17090710cb00b006d5c0cd5e0dsm7168399ejb.82.2022.03.14.13.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:09:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FAB51FFB7;
 Mon, 14 Mar 2022 20:09:49 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Mon, 14 Mar 2022 19:48:47 +0000
In-reply-to: <20220314160108.1440470-4-armbru@redhat.com>
Message-ID: <877d8w5m9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
<snip>
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -97,9 +97,9 @@ static void qjack_buffer_create(QJackBuffer *buffer, in=
t channels, int frames)
>      buffer->used     =3D 0;
>      buffer->rptr     =3D 0;
>      buffer->wptr     =3D 0;
> -    buffer->data     =3D g_malloc(channels * sizeof(float *));
> +    buffer->data     =3D g_new(float *, channels);
>      for (int i =3D 0; i < channels; ++i) {
> -        buffer->data[i] =3D g_malloc(frames * sizeof(float));
> +        buffer->data[i] =3D g_new(float, frames);

Are these actually buffers of pointers to floats? I guess I leave that
to the JACK experts...

>      }
>  }
>=20=20
> @@ -453,7 +453,7 @@ static int qjack_client_init(QJackClient *c)
>      jack_on_shutdown(c->client, qjack_shutdown, c);
>=20=20
>      /* allocate and register the ports */
> -    c->port =3D g_malloc(sizeof(jack_port_t *) * c->nchannels);
> +    c->port =3D g_new(jack_port_t *, c->nchannels);
>      for (int i =3D 0; i < c->nchannels; ++i) {

I guess JACK just likes double indirection...

>=20=20
>          char port_name[16];
<snip>
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -177,7 +177,7 @@ static void register_vfs(PCIDevice *dev)
>      assert(sriov_cap > 0);
>      num_vfs =3D pci_get_word(dev->config + sriov_cap + PCI_SRIOV_NUM_VF);
>=20=20
> -    dev->exp.sriov_pf.vf =3D g_malloc(sizeof(PCIDevice *) * num_vfs);
> +    dev->exp.sriov_pf.vf =3D g_new(PCIDevice *, num_vfs);
>      assert(dev->exp.sriov_pf.vf);

So what I find confusing about the conversion of sizeof(foo *) is that
while the internal sizeof in g_new is unaffected I think the casting
ends up as

 foo **

but I guess the compiler would have complained so maybe I don't
understand the magic enough.

<snip>
> index 42130667a7..598e6adc5e 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name=
, PCIDevice *dev,
>      qatomic_set(&ring->ring_state->cons_head, 0);
>      */
>      ring->npages =3D npages;
> -    ring->pages =3D g_malloc0(npages * sizeof(void *));
> +    ring->pages =3D g_new0(void *, npages);

At least here ring->pages agrees about void ** being the result.

<snip>

So other than my queries about the sizeof(foo *) which I'd like someone
to assuage me of my concerns it looks like the script has done a
thorough mechanical job as all good scripts should ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

