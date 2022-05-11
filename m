Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE342523775
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 17:39:16 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nooQl-0003ny-G4
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 11:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nooPk-00034P-E8
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nooPh-00010x-FQ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652283487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=672fnWHWk7Ll2ituv9lZ1kYHkgVg8KJg7pM5es4750A=;
 b=X4FRf07K2xxMxa7RxHIiwkIreG23ynzdnEa0XNlZZii/Gu4lsTwgGeN2ZGnGez1sqUbYCX
 iExVZkpFjQ+62RWC/uIR059qvRr8MkGTIK4z5WeYxsxFpSQCMyz3/ZpQ9snPvr+EIHKZ/M
 8Bxr3C0uk5ND+lkBWq/MNTPkJklJGNU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-NAZaIxWpOYGwOZikkceKzQ-1; Wed, 11 May 2022 11:38:06 -0400
X-MC-Unique: NAZaIxWpOYGwOZikkceKzQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 x79-20020a25ce52000000b006497f075e7dso2170634ybe.15
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 08:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=672fnWHWk7Ll2ituv9lZ1kYHkgVg8KJg7pM5es4750A=;
 b=dUpgZck1QbYWJfwnHL54wxTtidB25C2rfgnpnGLGf3qYIf83R0GnscYZ12RvogcHdT
 Ujg0eab9sM/oO+PdwOtpjwH0/+/yegImYxWSG1vc20p2bCXdqaGsUN3lP5F5wg8rcNcO
 TebhyedHsW1crXKohjJ6QloVoE78WhnhPs5KJ/xUWbbqBTaUwFMloa6BzwcPYY1uwDeH
 //5WDacRGzn08Zp/IIAzItazm+O8N5KD5Y+d7534R7I5U/w+LOdP7BoK0i69+Mc+O32f
 HLRyfDYr8J0S1ujMKOluYQKFTEDOpU5U7v0aanV/0qbobnimNWAR0rry+Ycorj3JK1rf
 KuOg==
X-Gm-Message-State: AOAM532wc3k/QVvft36Bw74632Wr6nXB9luMfcPphfYfyUBewwR5Wfyx
 4XKSovo4p3AMfmTqpD1r/U77OKwi5PyaniNrzGLYJ6upzuSx71KxABmSNOdSetg5aEhYtSbtkbZ
 hRHdHHO4QpJYO2xrfJra3ZDwl38fD2wk=
X-Received: by 2002:a25:ab33:0:b0:648:4c23:c4b2 with SMTP id
 u48-20020a25ab33000000b006484c23c4b2mr23225368ybi.403.1652283485528; 
 Wed, 11 May 2022 08:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrV8b4I6IgdQwWS0zYTtM/gShExgxkKn24wd+SlAHsCFpUfHODHwYSC70OaivbAfJ92SE2aJ4Lof0R67HDeJo=
X-Received: by 2002:a25:ab33:0:b0:648:4c23:c4b2 with SMTP id
 u48-20020a25ab33000000b006484c23c4b2mr23225347ybi.403.1652283485325; Wed, 11
 May 2022 08:38:05 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 08:38:04 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YnpfuYvBu56CCi7b@redhat.com>
Date: Wed, 11 May 2022 08:38:04 -0700
Message-ID: <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Victor Toso <victortoso@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 10, 2022 at 01:51:05PM +0100, Daniel P. Berrang=C3=A9 wrote:
> In 7.0.0 we can now generate
>
>    type BlockResizeArguments struct {
>        V500 *BlockResizeArgumentsV500
>        V520 *BlockResizeArgumentsV520
>        V700 *BlockResizeArgumentsV700
>    }
>
>    type BlockResizeArgumentsV500 struct {
>        Device string
>        Size int
>    }
>
>    type BlockResizeArgumentsV520 struct {
>        Device *string
>        NodeName *string
>        Size int
>    }
>
>    type BlockResizeArgumentsV700 struct {
>        NodeName string
>        Size int
>    }
>
> App can use the same as before, or switch to
>
>     node :=3D "nodedev0"
>     cmd :=3D BlockResizeArguments{
>         V700: &BlockResizeArguments700{
>             NodeName: node,
>             Size: 1 * GiB
>         }
>     }

This honestly looks pretty unwieldy.

If the application already knows it's targeting a specific version of
the QEMU API, which for the above code to make any sense it will have
to, couldn't it do something like

  import qemu .../qemu/v700

at the beginning of the file and then use regular old

  cmd :=3D qemu.BlockResizeArguments{
      NodeName: nodeName,
      Size: size,
  }

instead?

--=20
Andrea Bolognani / Red Hat / Virtualization


