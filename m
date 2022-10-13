Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609915FDCA5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:51:21 +0200 (CEST)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oizYN-00060K-Qm
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizSv-0002sj-Ir
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizSs-0004xo-KG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665672337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8oynY8R8Pm4AyFPWfMTbFzup+Tk6ESkp1QmIAvc0G4=;
 b=FJzRVnUXOZWpRRKeNam3G19y4ltuD8Ineowoe0K2GEhC2DaWBXRdElg5d0SvKDEZOqp/oA
 h1+jvGcBipuwjJYjrienDhxqALiY0ZNIB9fR3QxeGUv+MQOZhd72KirYNFIGxTFwaJrbTd
 pN8dHDOOc+6xxWkHGvFn0hhSBMo0lD4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-mdiiO-hrOlmukdkTXMArhA-1; Thu, 13 Oct 2022 10:45:36 -0400
X-MC-Unique: mdiiO-hrOlmukdkTXMArhA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso1302493wma.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 07:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8oynY8R8Pm4AyFPWfMTbFzup+Tk6ESkp1QmIAvc0G4=;
 b=iOfF7mJpl6L7mP22rI8KvpPwrTL/b/L77reQD7KSzZvbLkM56s+qe/XbpS/Bg2i+kq
 93EXhexcFeOX86qAYbTCnmDBNsX5cMFlqyM74ObXQL8Ism8MkuGikwXvMSXSbcogMhD+
 tktXU0CzKBvYJqEXvpIqDNzTPe8g8uEAFIT7I+e0INQRmx2bsuejXwuPO42ppUXwPOxy
 Djm5/Gn3U745T2R6wCRhpkDp+39n6RdYdxUbKzRE5jgIElZC+dBykPHDZYifgpLOWVdx
 Aqp6YT1NDwVDNtS3UB6xN80NTZHIjedgAPbJ+MNAtF4q5JSaNuSNJWUHP2yzGXotu6JX
 8New==
X-Gm-Message-State: ACrzQf16Mvnz+cZPKVtsmnKzcrXcPk/9ghndoVM9D2Fx7cpxwwUr40yX
 UePjJRAUbRWiYWAJ68yVqYxeoNyZpkr3dkKZwLfazQBip4KfzQc0ibUjTzTDBwf1UUdJikh7CpY
 gPkVxBnUuE2RbfRg=
X-Received: by 2002:a05:6000:1562:b0:231:1b02:3dbb with SMTP id
 2-20020a056000156200b002311b023dbbmr204905wrz.685.1665672334849; 
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rZNZbb3+31Dv90ThPuBJ7FCMnJ8/HkNKoxS+qQd+ETryuqQ/N4CEjIWNZVbbNa3LLSVHV2Q==
X-Received: by 2002:a05:6000:1562:b0:231:1b02:3dbb with SMTP id
 2-20020a056000156200b002311b023dbbmr204888wrz.685.1665672334647; 
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 bn24-20020a056000061800b0022a297950cesm2274413wrb.23.2022.10.13.07.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 07:45:34 -0700 (PDT)
Date: Thu, 13 Oct 2022 10:45:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
Message-ID: <20221013103756-mutt-send-email-mst@kernel.org>
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 <875yi2mat1.fsf@pond.sub.org>
 <CAE=JJXcRH-0TuM7WgbM35Nb=Ud94K-LUcdzjoyJDMEuK9o=uFw@mail.gmail.com>
 <87mtaitpph.fsf@pond.sub.org>
 <CAE=JJXcbioK4Nod0mSuRY1Mpj8nAYJvgX62cGyG8_MDfVgjyOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=JJXcbioK4Nod0mSuRY1Mpj8nAYJvgX62cGyG8_MDfVgjyOQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 02:39:27PM +0900, Akihiko Odaki wrote:
> Yes, I'd like to hear your ideas on how it should be split up. The
> main challenge here is that it changes the signature of a function
> without changing its name.

Lots of ways to do it, e.g.:


1. add a new api with a new name
2. change code to use new name
3. drop old api
4. add new api with old name
5. change code to use old name


or we can stop after 3, it's not too hard to come up
with a slightly different name.

Since all you are doing here is dropping an argument,
other hacks may be possible such as making the function
use variadic arguments temporarily.

-- 
MST


