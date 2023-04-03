Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157DB6D4440
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:20:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJ8z-0003V1-3f; Mon, 03 Apr 2023 08:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pjJ8r-0003Ui-LW; Mon, 03 Apr 2023 08:18:33 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pjJ8p-0001J2-UH; Mon, 03 Apr 2023 08:18:33 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-545e907790fso432044167b3.3; 
 Mon, 03 Apr 2023 05:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680524310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xz+xTJZERyISIcoATP0KD296OXxi7Qt/2urvL5RLnNU=;
 b=i8WhNIRGBEhchQTLkG2TGtSHcjeeTIic/f+WdpcpLeRGO4glmGX7LJXrEoXO8+Tqbh
 jy3khf5u5fy29SsB70vV/7Hbkqv1SBZ8lbtQ51jR0jbXqnWGel5UbZGpqkthnCuUbS1J
 dwpTUrjhqOgVXK3DAbsV1QwIlV1RDYuGSB92pB4P90ggSYkphZxuqjlU9qBa2jz8cmyC
 PUv3ElUbCIiAsT+Zd5SQJZnPq4k+rbOJgVariDQj9aHWXESSSvpKbALFVYD0rVQ9P42M
 0Kd0L654twoN8Cn8BVfEHvoYXBBJx0hSygeOZXEVbxZn9kCxrtN1JARp/3Up6kucPQXw
 53+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680524310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xz+xTJZERyISIcoATP0KD296OXxi7Qt/2urvL5RLnNU=;
 b=Vc4v1ML1cZ62tF6Xiu9RsccSFML8Pkw5U0kGXONeCTDyzx56ADGUDvUlnAMXVHVTUB
 04z2B8Gmhyo4L0KeMQEpLgcNmKy51+gkTNbO6Ldl5dtCagk4Wfqgr1aiY3JmaehI/bZl
 qS12aJ7siWzobCBYBSZCCKPohcVt8gMHQ+Syt7yjYJI0tWuXVGLrksasYEaV2EwWS5Pr
 4YN1jRQIMIkFUzevurPJ968FEGXphTJQbOA8LOi5WxThniarWzTAyGXOYgVanRq1RGN1
 Wdx7ulIXE16UxyLVo41szwNOGcipz/qCx1j9EInhBEHIut32bA9KlfE9osdmFUKBguhI
 fKzg==
X-Gm-Message-State: AAQBX9eryJ0ccTFfSPkyq4u0Sz3d2RBFA6ZVP1LtpGUbwq4LW2Ob+kTs
 1ZMcoK4hiuEwjOCUB9g7S1T/YU9griwCj+mQXq4=
X-Google-Smtp-Source: AKy350YpXiz3aA00nHjZ0odU8F17Ho8emao0sH7s/GZf0tSu+36pgySsekEPzMjZJdSc4mjFk++22FhSqskCJzmj5CU=
X-Received: by 2002:a81:b65f:0:b0:544:8bc1:a179 with SMTP id
 h31-20020a81b65f000000b005448bc1a179mr18234959ywk.4.1680524310113; Mon, 03
 Apr 2023 05:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230327144553.4315-1-faithilikerun@gmail.com>
 <20230329005755-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230329005755-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 3 Apr 2023 08:18:18 -0400
Message-ID: <CAJSP0QW1FFYYMbwSdG94SvotMe_ER_4Dxe5e+2FAcQMWaJ3ucA@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Add zoned storage emulation to virtio-blk driver
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, dmitry.fomichev@wdc.com, kvm@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de, Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, 29 Mar 2023 at 01:01, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Mar 27, 2023 at 10:45:48PM +0800, Sam Li wrote:
> > This patch adds zoned storage emulation to the virtio-blk driver. It
> > implements the virtio-blk ZBD support standardization that is
> > recently accepted by virtio-spec. The link to related commit is at
> >
> > https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad15db65af8d7d981
> >
> > The Linux zoned device code that implemented by Dmitry Fomichev has been
> > released at the latest Linux version v6.3-rc1.
> >
> > Aside: adding zoned=on alike options to virtio-blk device will be
> > considered in following-up plan.
> >
> > Note: Sorry to send it again because of the previous incoherent patches caused
> > by network error.
>
> virtio bits look ok.
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> merge through block layer tree I'm guessing?

Sounds good. Thank you!

Stefan

