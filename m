Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7E4D8C50
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:24:35 +0100 (CET)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqJ0-0002Uf-9v
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:24:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTqGs-00062D-PQ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:22:23 -0400
Received: from [2a00:1450:4864:20::631] (port=34691
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nTqGo-0007lD-UR
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:22:22 -0400
Received: by mail-ej1-x631.google.com with SMTP id gb39so35960730ejc.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tycv6HJZUTnQM7on2TavcKhNCFhbcZz1vxyWXIQR71o=;
 b=A0oYLouNRVTZ4V9w3HZxOkB6cJW9hiI3hbFyTqQMx9TKG2yR59woJojs96yqxoBIuC
 YUMI4L32csrMTrJ97Quu8vYBMDdCkobHf+Ilop8Mi2A98XMYLmS6xUm59zLvi0olWvPO
 epYH0BSvosR26pLIH2BGasEfulC8lnKJcQI5bMuiy0mk3M9L7uraIExkoDhzQ+YH/Qiu
 wf7HJSEQuk606ZD7pnYWZGLuoUahygOlfF++b9QAxAvINlDfnwldYbX0i0mMsTl+PIPZ
 X4cBbVK210OAe7WBg8X3EeM3L2anNSTnuu/JTD1/Av9oTe1rBpyrU9Wnoq81+J1uK0F+
 fZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tycv6HJZUTnQM7on2TavcKhNCFhbcZz1vxyWXIQR71o=;
 b=Lf+bimTc30nrJLf6IjjYmynoKtAYwV/P3VhbRQWPybXxmWlQJAt+1m16caH6m5kSba
 6gfmE7KedzLsvAbu+W5ZFAtp0I18Rd63vKuJ1CSeL+3GlcQ+RB4FGM4Yv3d5ydWuO/Aq
 UIycVq8AY5Ai+Bh/YBaEbBDD7e/o8HitTNwPP6QT85cCQNqyunrl9tOQ7dThtjoqcCUy
 ffwHk2MdBQQ4xYgU6VuhWt/lxm5n1OQbdHmpPMbqRLuuauq71ejRzGxDsnHBK3ETayFP
 wVeP9VDBBAI9dDF8++25eFazZNURDPLcj2dhvslUTXc1/ksn2WUAxXIRBbAGujxiu1px
 bhEA==
X-Gm-Message-State: AOAM530pn/HVgArxfWEFwVYnXbl6CZzcAWOkF2hynA99m7nptrWiqXjx
 VL1MYxQ+6bDnpLYBaW1P91BmpQ==
X-Google-Smtp-Source: ABdhPJzkkqh2Xbgzr0Voz+O2btuSoaFXnwIpWuwZz7MTY1zqLt/vbXJsWFBor8uL64fKWDLfruKO9g==
X-Received: by 2002:a17:907:3e1d:b0:6d7:1031:7e0 with SMTP id
 hp29-20020a1709073e1d00b006d7103107e0mr19280967ejc.580.1647285736651; 
 Mon, 14 Mar 2022 12:22:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm7117295ejm.115.2022.03.14.12.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 12:22:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0921D1FFB7;
 Mon, 14 Mar 2022 19:22:15 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-2-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Date: Mon, 14 Mar 2022 19:22:09 +0000
In-reply-to: <20220314160108.1440470-2-armbru@redhat.com>
Message-ID: <87ilsg5ogp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

> This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
> friends where that makes obvious sense".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

