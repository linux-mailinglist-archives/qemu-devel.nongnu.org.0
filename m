Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F576C0251
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 15:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdtoo-0007lK-60; Sun, 19 Mar 2023 10:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pdtol-0007kH-57
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 10:15:27 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pdtoj-0008MP-BP
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 10:15:26 -0400
Received: by mail-qt1-x82f.google.com with SMTP id x1so10438637qtr.7
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112; t=1679235324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VNg753/yIWoQptKRN8msylhG5torULvAip8ekSKy+FI=;
 b=fN1vScaEKVnBa6GWysokh3MKO8Zc55ibYhUls/inGIV4ueK3NTFDfp31A52eua1KBR
 5eWwiIY30+7MgFhfGRNWuRiX8JNhi9lq1hiRpRGvPDXaEWIJetzvYZU2654++xJthkNc
 rVcuzb25rqsXfthy3mkIO4V3DB+9SJBB/duKjsOPyMC/J+AiVUzSZt1yGgqRB+XeV9gv
 o4x6h93wf14EdF6zvM6QCUB8FAg5dA7T0EiiXvb/uQr8v77GgpjUhS8wRoiP1q8CtTY9
 DvNBGqguWEQm9cLds7qFy1/caLJx4KnHeCwRd4qRKP1wATKGONmueYASB+ai6KQVHHcj
 +Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679235324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNg753/yIWoQptKRN8msylhG5torULvAip8ekSKy+FI=;
 b=cmjwaVUMgc+Jj0XrfEC0spUnHe3plvrYmppQR3BT0ujgSJDvyCC0SiXWr3bk5ayaTz
 /44geTK3cxfpPOhkbK1Op9ayeezJ0QnvjvjdCz1o/+Tg9isPTtDZIFaJsL7be5UuxBoM
 Oo//Izaa/55D6rsSLA3jp+ARc/Av5VQfATi6KzvJbKo1062XSL+8uIW9KcPneRPezXh8
 BfITBX33qR/ze/euOcubpABpF/WjECdsrHU8gTkDZ8/k4y5EeGo2ELNnsyqUN6bHqMBz
 xJ8mXARQIC1Th1bUMv71+NK0OlZ1b0o3W5bSDaT04Ux4D6aymKep5HRUAcZoQOrqIvH2
 Msjw==
X-Gm-Message-State: AO0yUKWw/aQrpeUHwn04YrrLt+Bw4Ap8k/SMwILG/Bq1Y3xbEMb7LKvB
 q0PubowCTnhAJ4qretelOZY4gA==
X-Google-Smtp-Source: AK7set/wmYg8CgPu/DmvgkY+TkhJlukN+z8JO+ZjE0/SGeduum3w1DBZ2zywMc+ybMHGmi7j/NJeow==
X-Received: by 2002:ac8:59cb:0:b0:3db:575e:613a with SMTP id
 f11-20020ac859cb000000b003db575e613amr12471376qtf.23.1679235323879; 
 Sun, 19 Mar 2023 07:15:23 -0700 (PDT)
Received: from localhost ([143.244.47.76]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac846da000000b003bfb5fd72a7sm4698172qto.86.2023.03.19.07.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 07:15:23 -0700 (PDT)
Date: Sun, 19 Mar 2023 10:15:21 -0400
From: Emilio Cota <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] fix for #285
Message-ID: <ZBcY+WL+65D7Zi5F@cota-l14>
References: <20230205163758.416992-1-cota@braap.org>
 <Y+92tpDQVytnfvnd@cota-l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+92tpDQVytnfvnd@cota-l14>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82f;
 envelope-from=cota@braap.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Ping. Any feedback on these two patches?

https://patchew.org/QEMU/20230205163758.416992-1-cota@braap.org/
https://lore.kernel.org/qemu-devel/20230205163758.416992-1-cota@braap.org/

Happy to resend if needed.

Thanks,
		Emilio


On Fri, Feb 17, 2023 at 07:44:38 -0500, Emilio Cota wrote:
> Ping.
> 
> This fixes a bug (admittedly with a big hammer) that affects
> users with heavily multi-threaded user-mode workloads.
> 
> Thanks,
> 		Emilio
> 
> On Sun, Feb 05, 2023 at 11:37:56 -0500, Emilio Cota wrote:
> > Changes since v1:
> > 
> > - Add configure check to only use QTree if Glib still implements gslice.
> >   If Glib doesn't, then we call Glib directly with inline functions.
> > - Add TODO's so that in the future (i.e. when the minimum version of
> >   Glib that we use doesn't implement gslice) we remove QTree.
> > - Add comment to the top of qtree.h.
> > - Make qtree-bench results more robust by running longer or more times.
> > - Drop deprecated API calls (they're unused in QEMU).
> > - Drop API calls that are too recent (they're unused in QEMU).
> > - Drop macro benchmark results from the TCG patch since they're too noisy.
> > - Add test program to the commit log so that we don't lose it in the future
> >   even if the bug tracker goes away.
> > 
> > Thanks,
> > 		Emilio
> > 
> > 

