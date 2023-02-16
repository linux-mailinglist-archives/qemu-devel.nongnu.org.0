Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC75B699A0C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh9m-00052L-04; Thu, 16 Feb 2023 11:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh9j-00051J-Iy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:30:47 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh9h-0002G6-8T
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:30:47 -0500
Received: by mail-pg1-x52e.google.com with SMTP id a23so1614119pga.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676565042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jkstSIRlMtzxcNbVMLvyxGOcycN3RhvLxNo5X3UIhHk=;
 b=DOY3NjhDZ3mh4skO9qx2iTW5ZbqEW2W52sI4EbZ1j4Asd2TFIVF3c+mDmb/8nF3PEh
 0YtTiJhRQstGiwASmFkVxlxLpX2yLXX08Ga+1CvsomOCVN5KWRRnx3MjpxejS/yemMf7
 BHv3yA5BHeum3rC1nGSVlhua2Cn6g6a1lb/SUX/Z+3k/3M6EmsaX+1CnfTyhqZsnIuFt
 QoGLSsSP0laX3zQcyrHdQQJH9RMVjkHuRAmAVCWCtD1LNujkEX2+HAosBRzEHqAjkvap
 hYEarz/uFwddyk5eHANMZ8qCfgkMW7KWGS9N5C51Ev709oOjfvrKP1g8rF7mzcv2OkAg
 Vd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676565042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jkstSIRlMtzxcNbVMLvyxGOcycN3RhvLxNo5X3UIhHk=;
 b=sVPEzmQCGwsPhkNYkrWZSVDQgTc5ZHQtwfp4844fRta0feLYi908PMHhVH66SpiySG
 D4o241gYzs3s8KkOm4n/vQh+1foS/MQ4hNkc+jeFaKMavGBImd0QKf4EQA4vNk02/vyy
 PYRFUs8cp3RNlCAzVg+v2vyE4z2vtwSdqcbqKWSLCHSG08BIbWfmF68T9RUv+jpddohd
 koAhHCWGYhbg+QO5Cnef8+wp30b5rcHkKqlGMzPAHm+iNOoNpF+rY9Sq5rZgVeMSPI/2
 B0vIFS5hwBq657Xm+C5moQWBeol9Anmwp+UOcaxdcA1ZPlWa2qcbOt90EyWXy3Jy1MtD
 zrZw==
X-Gm-Message-State: AO0yUKV00Rupk6HL7k6VkxSYpjaJ9Px48kh3tTTCjVOahY0ZLKadmGxS
 LnDQ6x3xZtF74bS0BP8TKE0MOPdftHshkdc4rSaArw==
X-Google-Smtp-Source: AK7set/mbtBOI/icRSShGXKwmOufZ0yYtIxTT0QNUZcphHv27AtXWyXMfJUoqPnGIOtQkF3q4SNjS8ZZXCEbHrLJeW0=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr182189pfd.48.1676565042406; Thu, 16 Feb
 2023 08:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
In-Reply-To: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:30:30 +0000
Message-ID: <CAFEAcA-pnE4rg5KrFikZ2XVzy9OYiSxrco4G18GGk12CKec1gQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 16 Feb 2023 at 16:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > Hi, could someone take this?
> >
> > I rebased and put the two series together to simplify. I'm keeping it
> > up-to-date and tested while it doesn't go in.
> >
> > CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
> >
> > Based on master.
> > Supersedes "target/arm: CONFIG_TCG=n part 1".
>
> I've taken patches 1-5 into target-arm.next.

I've also taken patches 18, 19, 22, 23, 24, which seemed like
straightforward test fixes.

thanks
-- PMM

