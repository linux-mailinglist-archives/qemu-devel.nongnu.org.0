Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90C546E96
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:43:16 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzlTP-0002oR-IY
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzlRl-0000ei-L5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzlRi-0007gU-JB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 16:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654893689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=2aqYTLwxpnNkmUjCCoeVJ3YLA9h67CMkSUebw/BUf/s=;
 b=KqFNsrxdGfoLcC/2IvN7zYjdiD990kCT7klfu/fzwOsEAb7jMID+dXNglVW2M8hc3SFfKP
 X59J3xq3I/Dek/Ri8e77cwsSoaoa38Ep54zneVHPxrXLrqnATHsHB8Vl1MDhbuDJ0YhyLF
 X8lfNWE3dPpRJkFwuCPyYLP+fjTYsIo=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-2K4i2kquO6m0UVUBbTDjIQ-1; Fri, 10 Jun 2022 16:41:28 -0400
X-MC-Unique: 2K4i2kquO6m0UVUBbTDjIQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 s18-20020a67df12000000b00324c903413cso28512vsk.23
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 13:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2aqYTLwxpnNkmUjCCoeVJ3YLA9h67CMkSUebw/BUf/s=;
 b=DVGcCXh3CQqV4/EP5/LvaTFcfdqAu8iTl/dKx0TbkfDA2oSIcorcJP7QRZTKaYb4rB
 nvNXcGJyoZfttA+Jb0yKO4NIWbkqSyT0vzHDa3mrEMtTHTk3LEBEEsNZGVQ4wm8xP2nb
 SJ1bpPbR5T0eozlFKIubp+oA+LAVXzQcN9CzlYahVDumaZVdfa0ALT+0TvmN/yFDuOIw
 Wj1RwiLraqyYD9GLn/E6QzJ8mIuRTNv70EpRDKUprfoaRmL5uBiWrSyiu0gxtnGWoU7u
 SUQ/Urz2C/6dDdzPJ9L3HyHxzZ+lR4uSj1WsZFKDPCtOGbI2uBihaveDV7FRtFlXhMuq
 sUSw==
X-Gm-Message-State: AOAM533Xtuc3LhmrmBSF/mULUm5apREcn6/2dOJG7NhuYjp8z9G4ISsr
 nn60ygFsS1brGh9BoGpi0xtokcsGVUX1b9d/RdVlG7/KlXqBvZ9zOpr3HhjubAEdcW22bliiLl8
 fGrdcD2Wtwbdm73k3Hi9aVmxWdWC4TwM=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr40755894uad.100.1654893688178; 
 Fri, 10 Jun 2022 13:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoOOQGM3tI9yD3CRIfHSkGleURq2ziDvZGIwPqw/lLK8dFJi4gc8HHEX09IoVkLzpbwvEObhwOu4ZOihuvlvM=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr40755883uad.100.1654893687924; Fri, 10
 Jun 2022 13:41:27 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Jun 2022 16:41:17 -0400
Message-ID: <CAFn=p-biX5Tp6OHLU95ba3W0z33tHWmRE==q-bn=FAf353LZpg@mail.gmail.com>
Subject: Ubuntu 18.04 VM tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Hi Alex:

The Ubuntu 18.04 image is by now quite old and we could move our
support forward to Ubuntu 20.04. I have an interest in doing so in
order to avoid a version of pip that is old enough as to cause
problems for some Python work I am attempting to do in order to split
the QMP library fully out of the qemu.git tree.

However, it looks like Ubuntu 20.04 does not have equivalent i386
builds, so I can't just do a drop-and-replace. Do we need a
replacement i386 guest of some sort?

Looks like Fedora dropped i686 some time ago, debian might be our best bet?

--js


