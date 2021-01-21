Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29B2FF718
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:23:16 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2hQB-000357-IL
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2hPJ-0002dW-IE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 16:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2hPG-0007N2-3D
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 16:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611264135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3pfVWQT2oS3e3EarrZeIRQKfyS4i5rVDy2nb+u2IwY=;
 b=g+kyOXl//5vxnkJuycTkDHPA7c5Qv1VzXs5NXNfHVpQblX2OVScWOfkyO3CSEcA4WPm93t
 IdCECcJo/rtx304gkD4iXsKS8qJO7I7Eu6N20X6TjjblEcbl2GHNoJIdGIqboPXL3pLunu
 +jahUNUm/8N+GrW1FpG+UgHeFSkRxfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-RzyO4HkRPvKdfrzFBdci_Q-1; Thu, 21 Jan 2021 16:22:12 -0500
X-MC-Unique: RzyO4HkRPvKdfrzFBdci_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537EC84E241
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 21:22:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-169.ams2.redhat.com
 [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732716EF49;
 Thu, 21 Jan 2021 21:22:06 +0000 (UTC)
Subject: Re: [PULL 10/11] vnc: move initialization to
 framebuffer_update_request
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210115102424.1360437-1-kraxel@redhat.com>
 <20210115102424.1360437-11-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <26961441-e25b-25a1-b2e7-a6bb6a439022@redhat.com>
Date: Thu, 21 Jan 2021 22:22:05 +0100
MIME-Version: 1.0
In-Reply-To: <20210115102424.1360437-11-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "=?UTF-8?Q?Daniel_P_._Berrang=c3=a9?=" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/15/21 11:24, Gerd Hoffmann wrote:
> qemu sends various state info like current cursor shape to newly connected
> clients in response to a set_encoding message.  This is not correct according
> to the rfb spec.  Send that information in response to a full (incremental=0)
> framebuffer update request instead.  Also send the resize information
> unconditionally, not only in case of an actual server-side change.
>
> This makes the qemu vnc server conform to the spec and allows clients to
> request the complete vnc server state without reconnect.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-id: 20210112134120.2031837-3-kraxel@redhat.com
> ---
>  ui/vnc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

This patch breaks QEMU for me.

Bisection log below.

(I started the bisection from commit facf7c60ee60 ("vl: initialize
displays _after_ exiting preconfiguration", 2021-01-02), which is the
fix for the previous display regression. I noticed the regression after
pulling master today, at fef80ea073c4.)

> git bisect start
> # good: [facf7c60ee60aab7d73b204ee8c86b90fbc6b3db] vl: initialize displays _after_ exiting preconfiguration
> git bisect good facf7c60ee60aab7d73b204ee8c86b90fbc6b3db
> # bad: [fef80ea073c4862bc9eaddb6ddb0ed970b8ad7c4] Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' into staging
> git bisect bad fef80ea073c4862bc9eaddb6ddb0ed970b8ad7c4
> # good: [88d4005b098427638d7551aa04ebde4fdd06835b] tcg: Use tcg_constant_{i32,i64,vec} with gvec expanders
> git bisect good 88d4005b098427638d7551aa04ebde4fdd06835b
> # bad: [1eaada8ae15f10f7a7f1e2505bd77dbb11a8be85] hw/riscv: sifive_u: Use SIFIVE_U_CPU for mc->default_cpu_type
> git bisect bad 1eaada8ae15f10f7a7f1e2505bd77dbb11a8be85
> # good: [c7a9ef75173f090616328d6870f71e8da2b6bd50] target/mips: Introduce decode tree bindings for MSA ASE
> git bisect good c7a9ef75173f090616328d6870f71e8da2b6bd50
> # bad: [7cb6b97300f0405b4c6856c49bdc33fa3265852f] Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210115-pull-request' into staging
> git bisect bad 7cb6b97300f0405b4c6856c49bdc33fa3265852f
> # good: [eaca85763bcd94ddac3fa11f8cc20e974dc11102] target/mips: Remove vendor specific CPU definitions
> git bisect good eaca85763bcd94ddac3fa11f8cc20e974dc11102
> # good: [5f8679fe46d78acfa5fc43a3fd6b3fe95525d9bd] vnc: Fix a memleak in vnc_display_connect()
> git bisect good 5f8679fe46d78acfa5fc43a3fd6b3fe95525d9bd
> # good: [a968a38005bf2568605cac7f86b9fba7fc089726] Merge remote-tracking branch 'remotes/gkurz-gitlab/tags/9p-next-2021-01-15' into staging
> git bisect good a968a38005bf2568605cac7f86b9fba7fc089726
> # bad: [9e1632ad07ca49de99da4bb231e9e2f22f2d8df5] vnc: move initialization to framebuffer_update_request
> git bisect bad 9e1632ad07ca49de99da4bb231e9e2f22f2d8df5
> # good: [b3c2de9cd5bc0023901e7a4d568dfc5152b6cc4a] vnc: move check into vnc_cursor_define
> git bisect good b3c2de9cd5bc0023901e7a4d568dfc5152b6cc4a
> # first bad commit: [9e1632ad07ca49de99da4bb231e9e2f22f2d8df5] vnc: move initialization to framebuffer_update_request

The symptom is the following: in virt-manager, the display remains dead
(black), when I start an OVMF guest. At the same time, unusually high
CPU load can be seen on the host; it makes me think that virt-manager is
trying, in a busy loop, to complete the VNC handshake, or some such.
Ultimately, although the guest boots up fine, virt-manager gives up, and
the display window says "Viewer was disconnected".

Versions (apart from qemu):

- gtk-vnc2-0.7.0-3.el7.x86_64
- gvnc-0.7.0-3.el7.x86_64
- libvirt-daemon-6.6.0-8 (rebuilt from RHEL8 to RHEL7)
- spice-gtk3-0.35-5.el7_9.1.x86_64 (in case it matters...)
- virt-manager-1.5.0-7.el7.noarch

The domain config is:

>     <graphics type='vnc' port='-1' autoport='yes'>
>       <listen type='address'/>
>     </graphics>
>     <video>
>       <model type='qxl' ram='65536' vram='65536' vgamem='16384' heads='1' primary='yes'/>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
>     </video>

Reverting

- 763deea7e906 ("vnc: add support for extended desktop resize",
  2021-01-15), and

- 9e1632ad07ca ("vnc: move initialization to
  framebuffer_update_request", 2021-01-15),

in this order, returns QEMU to working state.

Thanks
Laszlo

>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 0f01481cac57..b4e98cf647f5 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -661,10 +661,6 @@ static void vnc_desktop_resize(VncState *vs)
>      if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
>          return;
>      }
> -    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
> -        vs->client_height == pixman_image_get_height(vs->vd->server)) {
> -        return;
> -    }
>
>      assert(pixman_image_get_width(vs->vd->server) < 65536 &&
>             pixman_image_get_width(vs->vd->server) >= 0);
> @@ -2014,6 +2010,10 @@ static void framebuffer_update_request(VncState *vs, int incremental,
>      } else {
>          vs->update = VNC_STATE_UPDATE_FORCE;
>          vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
> +        vnc_colordepth(vs);
> +        vnc_desktop_resize(vs);
> +        vnc_led_state_change(vs);
> +        vnc_cursor_define(vs);
>      }
>  }
>
> @@ -2154,10 +2154,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>              break;
>          }
>      }
> -    vnc_desktop_resize(vs);
>      check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
> -    vnc_led_state_change(vs);
> -    vnc_cursor_define(vs);
>  }
>
>  static void set_pixel_conversion(VncState *vs)
>


