Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8859D694
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:19:50 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQ4a-0003xK-WA
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oQQ1B-0002V3-Ju
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oQQ18-0003nZ-Hz
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661246173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MlqDq8fSmMBPZy0FSSlNsoORmJkq5YMSVCgpzdxLNvs=;
 b=YKT4OSjYjTlF4vDA6y/48YkM5VUrnr68v1KQn6/bKLxm7kNpgvD9reTxehWROoFDYFxwuK
 ybGJqlqjtaBw53IfbGw21+KEISIfP36fjueNjycVttMf0osA4c5wkUx2TXxPCCSPEIOi6E
 nWRRZWlAdIBB79ePMS2gY/6bnG4ADTc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-672R8gyONWOlUscXJ832-g-1; Tue, 23 Aug 2022 05:16:12 -0400
X-MC-Unique: 672R8gyONWOlUscXJ832-g-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-33352499223so230452857b3.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc;
 bh=MlqDq8fSmMBPZy0FSSlNsoORmJkq5YMSVCgpzdxLNvs=;
 b=1t/0qr93/wHLHhLvwX8oopRmK122ZTkRSWIONHZn4xZ/E4yaDKJgLVAk0xqdIamfNw
 R1yBzNvdta6J7NcdSJeMy6nVKPgq/cNA98oR9dVHHZ9PoU8c9THs4QoHdtT2Ke0O2FcI
 gx5KbRM186pulRQF11+1aoECggB2jKy1l/9KJcEFm9OcfYtQKnkZ1AvYWEwiInHbTG0Q
 b/Br/x0I9jeKNNHOd6iMfW8GqLHYmcjzoarom6C3VM9SMKJIn6feW4camdnaqzbNN/mQ
 IeK18NpsFCm+CS83o4cEH8FJYTrsp+NXMKX7XjqX0U/47EG4c7HmP/XeyYPXSp1FFBCe
 F/tQ==
X-Gm-Message-State: ACgBeo3MH5uxtiLktwVM7ZLwEaT6RcKlLELuBgIAg9ES5k9GkkXpURpS
 9ZKIFBZrRX61XK0BdUVqBG1+0iaF1Jj9yjqnaOfHPazAGQ3K3wXqac6RrYmGUp9pTnFnGGpfefv
 AKgcmDVO2xvcUNAkEvRhMy9UIXwZ9RI8=
X-Received: by 2002:a25:6611:0:b0:67b:e0c2:3239 with SMTP id
 a17-20020a256611000000b0067be0c23239mr22447668ybc.18.1661246171749; 
 Tue, 23 Aug 2022 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KSlw1onVcbPWUXl3LsA9jCQnL7qA72obXM9C1Wk8SuVzDvcKxsiLtFLCQrNGDZCVjU1pJoM9XhCCppBSpaIU=
X-Received: by 2002:a25:6611:0:b0:67b:e0c2:3239 with SMTP id
 a17-20020a256611000000b0067be0c23239mr22447662ybc.18.1661246171580; Tue, 23
 Aug 2022 02:16:11 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 04:16:11 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220818165358.217613-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220818165358.217613-1-jsnow@redhat.com>
Date: Tue, 23 Aug 2022 04:16:11 -0500
Message-ID: <CABJz62M8_197kahaNtBC1eSda5WJo6i7B1tsKF5+uMD+HXfj_A@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add signing pubkey for python-qemu-qmp package
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 18, 2022 at 12:53:58PM -0400, John Snow wrote:
> Add the pubkey currently used for signing PyPI releases of qemu.qmp to a
> stable location where it can be referenced by e.g. Fedora RPM specfiles.
>
> At present, the key happens to just simply be my own -- but future
> releases may be signed by a different key. In that case, we can
> increment '1.txt' to '2.txt' and so on. The old keys should be left in
> place.
>
> The format for the keyfile was chosen by copying what OpenStack was
> doing:
> https://releases.openstack.org/_static/0x2426b928085a020d8a90d0d879ab7008d0896c8a.txt
>
> Generated with:
> > gpg --with-fingerprint --list-keys jsnow@redhat.com > pubkey
> > gpg --armor --export jsnow@redhat.com >> pubkey

You might want to pass

  --export-options export-minimal

to the second command in order to obtain a significantly smaller file
that can still serve the intended purpose.

-- 
Andrea Bolognani / Red Hat / Virtualization


