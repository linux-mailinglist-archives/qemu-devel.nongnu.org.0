Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38895353E4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:26:01 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuJ7R-0005bt-0k
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nuJ5E-0004os-CJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:23:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nuJ5C-0003AR-7c
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653593021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dBfDxx/5zP2VbvVNV/cJi/dMNHdU9fECEgMjuukRCg=;
 b=D485d/ukZkWiBSnGcVsT/f58/pZfSz5Z3OMSqqbdfnOeYjROrysLUyVv3TYMNGt+S45sCf
 fEBVFFD4pog2reWQCV1U3DArqu3TsLfSilhelrI6g7MIJ4AibcBR4xh5gqXccKwdTRa27q
 AWuMR+2qVoif6GMWozGbXfVUpGb/cWo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-BqkDtWEeNoC1-JzJcvUmEQ-1; Thu, 26 May 2022 15:23:39 -0400
X-MC-Unique: BqkDtWEeNoC1-JzJcvUmEQ-1
Received: by mail-il1-f200.google.com with SMTP id
 l8-20020a056e021aa800b002cf778c63caso1708592ilv.10
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dBfDxx/5zP2VbvVNV/cJi/dMNHdU9fECEgMjuukRCg=;
 b=0SvQKFFa+/s0h3ZrTXJ8Otmmh4BkpngUfeR8NxdsEp+RccRV2Vx1Kku/W3pmasbrJ5
 skyrrUyNMbzYhSz1gyD2VMXDdm02KNQz9SIzpQfnvVGY2cfWVKFa/4SlNmW6fO3gHygD
 107II+HjUQIopKdif3oy4l3cRTUewqjM5zZtiI6ah5A0UqBx9m8o9EU9KSwgJrgE7gZv
 jyR+fePxZYFbLX4ndOZAOjY9KnI/Ul9hG5crqonQ+uW/3I1lJQFJ2CyOmjSVvaabLO/c
 61UJWCVPiTK9TN10akVkibkN4uXrMOUUH8jKkOMS5lkKF2NttusgWpGzR/Ep5UwhB5EI
 yMrg==
X-Gm-Message-State: AOAM532h6I4M984tLxoyxld30Cro6uu8i9fJDGD2+Sc6MRKcMLG/15SR
 qNcZBsq3PtnlFQsR4zQ9ApKm8voOMDairLOD9y72RDNhaTs7wenMQybiVlMv9Kq79s3m5so/fY8
 SBB2Pa2u7jB6QDUTX7e1pCa518ciiGjA=
X-Received: by 2002:a92:1902:0:b0:2c7:94cb:14b6 with SMTP id
 2-20020a921902000000b002c794cb14b6mr19244441ilz.70.1653593018905; 
 Thu, 26 May 2022 12:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Lc40XQhD5VCq7bPbnyHjdoPCGBjRRG9laIvo10ZvoZadPVkPrLKQaQjKPYRHeNs/1k7aWNwt3XXKQ6WEx7Y=
X-Received: by 2002:a92:1902:0:b0:2c7:94cb:14b6 with SMTP id
 2-20020a921902000000b002c794cb14b6mr19244431ilz.70.1653593018621; Thu, 26 May
 2022 12:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
In-Reply-To: <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 26 May 2022 20:23:02 +0100
Message-ID: <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, 
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 26, 2022 at 9:55 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> The bdrv_pread()/bdrv_pwrite() errno for negative bytes changes from
> EINVAL to EIO. Did you audit the code to see if it matters?

I don't believe I had, but I checked all calls now. There's ~140 of
them, so the probability of me having overlooked something isn't
exactly low, but it seems callers either cannot pass in negative
values or don't care about the particular error code returned.

Another option is to make bdrv_co_pread() and bdrv_co_pwrite() (which
have much fewer callers) fail with -EINVAL when bytes is negative, but
perhaps just getting rid of this final inconsistency between
bdrv_[co_]{pread,pwrite}[v]() now will be worth it in the long run.


