Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B6547003
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 01:30:52 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzo5b-00055b-7e
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 19:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzo3y-0004Mz-Gr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 19:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzo3v-0005nu-QT
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 19:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654903746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Sosh2OQUNP+f8umkICGShyv5zkeilyIHhpwIMm6HF/A=;
 b=OxHh+oH/yI8nhB41R+7TGalfRWwq1sX+nEnUatGo52eW3wKUAKIN8RevO1mtg+T+cFm12Y
 LZL4tdl2p6TpfXj0fFeYXOrcLmuzCksgmjbUb2JrdgdQDcoDhLUwHNxcYMSX1ddYvT5WCX
 +NFULn2DuvgVGr757b7IvZEXszb0aq4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-hPE71aE4OCyuL9IHIfKJ1Q-1; Fri, 10 Jun 2022 19:29:05 -0400
X-MC-Unique: hPE71aE4OCyuL9IHIfKJ1Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 r88-20020ab04561000000b0037955632d4aso219382uar.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 16:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Sosh2OQUNP+f8umkICGShyv5zkeilyIHhpwIMm6HF/A=;
 b=3Yvl6yoKVzYdNrMmBlPhHYLOYnCdDZ+rQU4Zr77tXx3ou+HSNuHCaM4x90LyTaEmM6
 +xSYFN+kBQShCN/Z7g9GxXCXlh1tI6tZxKe4DzFhAa9mDS0wXdx2MR9XeOfsR7tF2xcJ
 cyBbTIl8TNF3AxBxPWqMS5SBSmN6Pji+OhvjBjtlrmE2YPOgL0PuAZbebshFmnajV2aK
 CLp7qwGAZf6H256lc189vtK9A9tMNIYyVPetjwp4jl4RWAErAJg0GuPGPEl1NQuU3RG7
 hmtmPYfuMnXf7ex2Z7YgiEXUQcbHnS+uAbt6ZWlrG/S63NLoL558eOI4XuUQ/1s8cev+
 rA1g==
X-Gm-Message-State: AOAM533jMDmoTHzQlBXB7+YEghFF+gwiBdI6fZ/gJrR1kaNgcML3NpCa
 6PkP548QKx2I2sL6uXYswZVgp73SeQ0VpsyAd+C8gUYan9E30f1B3fQi/neijv/PvkIfB93WyGf
 p8MlkpKEShsqN25UlbxRzHv94tOm3HdU=
X-Received: by 2002:ab0:168a:0:b0:378:d73d:f630 with SMTP id
 e10-20020ab0168a000000b00378d73df630mr13164227uaf.119.1654903744972; 
 Fri, 10 Jun 2022 16:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1koouqzXHjrCC9BxZBGBefiTqNpCkX2Bb7SWi4ewd5IZomhylRroI5DxO8m2cUcU/O/oaCr8kz4oq+LkVu60=
X-Received: by 2002:ab0:168a:0:b0:378:d73d:f630 with SMTP id
 e10-20020ab0168a000000b00378d73df630mr13164220uaf.119.1654903744756; Fri, 10
 Jun 2022 16:29:04 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Jun 2022 19:28:54 -0400
Message-ID: <CAFn=p-ZwWzYa9h_-rNa-cA0CsDOJusy21D_RNtLffpTOgOHP-Q@mail.gmail.com>
Subject: CentOS 8 cloud images not working under VM tests
To: qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

This test doesn't appear to work for me:

def build_image(self, img):
    cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
    img_tmp = img + ".tmp"
    subprocess.check_call(["ln", "-f", cimg, img_tmp])
    self.exec_qemu_img("resize", img_tmp, "50G")
    self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
    self.wait_ssh()
    ^^^^^^^^^^^^^^^

It appears to be expecting to be able to use passwordless entry, but
that doesn't appear to actually work in this case.

It looks like the cloud iso generate step is supposed to handle
setting up keys -- and everything appears as if it's working -- but I
get SSH timeouts at this step.

From what I can see:

DEBUG:root:ssh_cmd: ssh -t -o StrictHostKeyChecking=no -o
UserKnownHostsFile=/dev/null -o ConnectTimeout=1 -p 41729 -i
/home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa -o
SendEnv=https_proxy -o SendEnv=http_proxy -o SendEnv=ftp_proxy -o
SendEnv=no_proxy qemu@127.0.0.1 exit 0
Warning: Permanently added '[127.0.0.1]:41729' (ED25519) to the list
of known hosts.
qemu@127.0.0.1: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

...and the /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa
file looks identical to the qemu.git/tests/keys/id_rsa file, save for
a missing trailing newline.

From a subsequent run, turning SSH debug on, I see this:

debug1: Offering public key:
/home/jsnow/src/qemu/bin/git/vm-test-o_x2vdwo.tmp/id_rsa RSA
SHA256:6TUK9PSgWR+CbTEKA6E9IyizVjt2ZW5ble/Mg4wUiao explicit
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51

... Which looks like the usual kind of bog-standard "Unrecognized key"
kind of answer, IIUC.

Is this working for anyone else, or can anyone offer some debugging
tips on what's gone wrong here? I'm assuming it worked as of
fb1fa97c69ca2299158229c78fea68c4036e6c1b ... Daniel, any clues?

--js


