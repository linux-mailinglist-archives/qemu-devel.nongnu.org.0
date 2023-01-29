Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B797680257
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:45:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMGPp-0007aC-82; Sun, 29 Jan 2023 17:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPo-0007a2-4I
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPm-0000Wc-MM
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so9492607wrb.11
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qj/VaPLF+8YROwSnsU4sauN36ka0orclS2WSB4j8LsE=;
 b=ektuvPQ3Eldfm43lVnxOuAICfRZO93t4uKqdWoZXrXHte286Ld3VYiTbKWoux5czbN
 3WV9vAMEHIksvHF2g2RJYZXre43PWIIZL/SslE+YAE3Js6/rEKVl6wEpBQgCB+rhWD8l
 pbTF6q2y5u7jjDnFC/zWYMMHD8c4TASCJM1E+Nmi2Cm7fS09NZ4Ek7o71gVt6W4OEytp
 YiCFdhlT6yVrKprYdj+njfOHBaYbJV+5F8bmAibOAPxlnKQKhtLRej2HhKairwrt6gEO
 YmGLNYqOt/7q0DYJroD2Bhhf2QqkyKP2vLuvwyxqp+p1xqeF4XV1Aq8+vYfySGY58hJU
 4PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qj/VaPLF+8YROwSnsU4sauN36ka0orclS2WSB4j8LsE=;
 b=pRzb6lfxTbHp6rxB4fxgeFYikKaFD3YWdbmabf9fGWVmrrAUd8zeGNxLqAPI8qKDWt
 q3+uHBEWIWPw0nsrxQCPL5+kHM6sZw1+wH7a4QAK3JBROjImfDfyWFln1cjigIzxpWnZ
 eQ4lHDP3nLSsXpPVfsLW60iUTacbr8KsPzX5zsBBrNPm69RbWqtWoF5KQJjHjzAXR9e0
 wQtW80IuK6T8POV1AXi5I8b0rBqpyX3/OvDjUZ+U/jiUBM+h9in5GvT94xOOuNnM1p2+
 OHYqCve78bKHVHlwl+a++FpAVzIww/QSdm4WI98aSbOuFoMaPt8QWYGl+HgdzeM9u8bJ
 lfxw==
X-Gm-Message-State: AO0yUKUuNzFgZH968oSoLK5ETx1COebxF7MsEIxEu0OZICRMgNQuCP9g
 9GXCyMctXX7Wza+RbsGFKuNswusfpJbTV1anQe4=
X-Google-Smtp-Source: AK7set9tfgxg440x7/ZjYn1eXgc4phSA13T0Ut3vRnTAJ3j0c4BFKNMZ0Bv1oe8zOA3z5WKsTMxduQ==
X-Received: by 2002:a5d:420a:0:b0:2bf:e39d:c8a7 with SMTP id
 n10-20020a5d420a000000b002bfe39dc8a7mr4411555wrq.44.1675032285335; 
 Sun, 29 Jan 2023 14:44:45 -0800 (PST)
Received: from localhost ([146.70.128.243]) by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b002bdd155ca4dsm10149219wrs.48.2023.01.29.14.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 14:44:44 -0800 (PST)
Date: Sun, 29 Jan 2023 17:38:08 -0500
From: Emilio Cota <cota@braap.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y9b1UHyyPux7FKV5@cota-l14>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
 <Y76s1VNBUYwlpIGo@redhat.com> <Y9FRoUI3I5LfQsjW@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9FRoUI3I5LfQsjW@redhat.com>
Received-SPF: softfail client-ip=2a00:1450:4864:20::429;
 envelope-from=cota@braap.org; helo=mail-wr1-x429.google.com
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

On Wed, Jan 25, 2023 at 15:58:25 +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 11, 2023 at 12:34:29PM +0000, Daniel P. Berrangé wrote:
> > On Tue, Jan 10, 2023 at 10:55:36PM -0500, Emilio Cota wrote:
> > > qemu-user can hang in a multi-threaded fork. One common
> > > reason is that when creating a TB, between fork and exec
> > > we manipulate a GTree whose memory allocator (GSlice) is
> > > not fork-safe.
> > 
> > BTW, I just checked latest glib status
> > 
> >   https://gitlab.gnome.org/GNOME/glib/-/issues/1079
> > 
> > it appears they're pretty close to deciding to delete the
> > GSlice impl and always use system malloc.
> 
> They have now merged the code to delete the GSlice custom allocator.
> 
> So glib >= 2.76.0 should not exhibit a hang
> 
> > So if we do take this patch series it'll hopefully be a time
> > limited thing to carry. 
> 
> So the question is whether the issue is critical enough that we want
> to carry a workaround for a while, vs telling users to upgrade to
> newer glib  (once 2.76 actually gets released)

That is great news!

Since this is a correctness issue, I think we should ship with qtree
and use it when configuring with glib <2.76.0. For later glib versions
we would just use gtree, e.g. via typedef + inline functions.

Once the minimum glib required by the configure script is >= 2.76.0,
then we'd remove qtree.

If that sounds like a good plan, I can send a v2.

Thanks,
		Emilio

