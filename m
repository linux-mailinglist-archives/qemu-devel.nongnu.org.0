Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91B345E08
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:28:33 +0100 (CET)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOg9A-000144-Cc
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lOg6h-0007f7-Oh
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:26:01 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:45162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lOg6Y-0004h1-Ou
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:25:59 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 30EF046201;
 Tue, 23 Mar 2021 13:25:36 +0100 (CET)
Message-ID: <4144cbea-4aa9-359c-f01e-34c16f2c1efe@proxmox.com>
Date: Tue, 23 Mar 2021 13:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH v5] sphinx: adopt kernel readthedoc theme
In-Reply-To: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: berrange@redhat.com, jsnow@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.21 12:53, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20

Just saw this patch by accident and as we also use the alabaster theme
for the Proxmox Backup project I wanted to share some insights from our
usage, as I checked that theme out closely a few months ago and did some
adaptions for, partially overlapping, short-comings we found.


> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page

That can be fixed with the following conf.py 'html_theme_options' setting=
:

'fixed_sidebar': True,

https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py=
;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c=
74a50d7223c875a04b#l161

> - the search bar is not always at the same place

Can be also addressed by setting 'html_sidebars' to a fixed order, e.g.:

html_sidebars =3D {
    '**': [
        'searchbox.html',
        'navigation.html',
        'relations.html',
    ]
}                =20

Can also be customized for different pages, e.g., we do so for landing pa=
ges:

https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/conf.py=
;h=3Dcfa4158d6b284172929785991f710d6237e9992c;hb=3D2ab2ca9c241f8315f51f9c=
74a50d7223c875a04b#l188

I added also a short JS snipped to scroll the heading of the current chap=
ter in
the sidebar TOC into view (adapted from rust book).
https://git.proxmox.com/?p=3Dproxmox-backup.git;a=3Dblob;f=3Ddocs/custom.=
js;h=3D7964b2cb0ea9433596845618f1679f1672ce38b8;hb=3D2ab2ca9c241f8315f51f=
9c74a50d7223c875a04b

If you want, you could check out the result at our hosted docs site:
https://pbs.proxmox.com/docs/managing-remotes.html

> - it lacks some contrast and colours

That is true, and IMO the rtd theme really uses a better colour palette,
especially for things like "Topic" blocks.
In fact we pondered switching over to rtd, so please don't see my mail
as me advertising that all issues can be fixed into alabaster, just wante=
d
to share what we did to overcome the first two short-comings mentioned he=
re.

cheers,
Thomas


