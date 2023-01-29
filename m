Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E4680256
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:45:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMGPl-0007Zu-73; Sun, 29 Jan 2023 17:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPj-0007ZV-2d
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPh-0000WO-My
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id t18so9536552wro.1
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4EvQj1WQ7LjlyQ4fT0E6yT+lebXzP91p2fg0cA59wgU=;
 b=VHHBy1RucaURa6d7sL/9G8NlgU5+6TYL2mM29UdsRgPq+43HsmO/RPbJt5xLvB2tVn
 w+BbDWBeBXRWijw4PfD7Nzw0bObVuS3iaRxhNE/ZCBNuqcJSzUWWKeE7I7A2YEM5JwpQ
 HUsTxFUjnRIPvQ+fPACGt3wjyMCgYO1g2q/fZejXD5A5x87N+Vpy+IZ5R+nJznoLC2EF
 KGN2jDLCTiiWsxuRbswGCV97xlmBBz5ZEx8NzH4ESXLUG+iYvcqEqOTKzqFR7xuwDDu2
 Z8KxR0YAze/gCXZ2vC+bCQ1iKXdrC82tx3qARotQJ3fNq2lj8O2mi7pVQxpLahcKuzSd
 iPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EvQj1WQ7LjlyQ4fT0E6yT+lebXzP91p2fg0cA59wgU=;
 b=8ARTSwoFpXhOUKqQRWw0zRADOF9qbGEBivd/+xmBaxXKQxnEkqi5LZNb6u0gajt8A7
 bLJjPAjbi1j8ln7HkODF4uBqBNY8UFLyote2gWbmQIaLNDRbNnaMVJpLpcgviSdqFy8v
 jRNbvaYOUpXueoIypIh6LY/cmYvNITsag5Ro/0o0f0ePytEm1no7C/znmfmBlbrK0Xe0
 QUzPIS+k1iGlj21lUqG1U9LrUhTqmkCj5lRg4EylZoWlZ25vKQx96v0NaUvqY6eQEt20
 /7Q5QO02QCSFTtpVVcSdNerVi9n7LeaPimtvoamI5dnr/eM3laoQh1VfQBGIMxIUN5zu
 T6+w==
X-Gm-Message-State: AFqh2ko74LzB7aHMQZYG6XNEX4YfZ4BAZIKDYgTg7yHYZqFHKPsQivBl
 Lpu/BP4/gQI7RQRURI4MD82yDw==
X-Google-Smtp-Source: AMrXdXsoVdl65Wtw4nO7RXo0wMl6kPVm+cJN9uHbnkgdJVltvtgSBJYcLFUDRqyzgn6dhCpCWkl1cQ==
X-Received: by 2002:a5d:48c7:0:b0:2bb:ed0c:a0d8 with SMTP id
 p7-20020a5d48c7000000b002bbed0ca0d8mr40551123wrs.53.1675032280359; 
 Sun, 29 Jan 2023 14:44:40 -0800 (PST)
Received: from localhost ([146.70.128.243]) by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b0028965dc7c6bsm10044991wrt.73.2023.01.29.14.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 14:44:39 -0800 (PST)
Date: Sun, 29 Jan 2023 17:32:05 -0500
From: Emilio Cota <cota@braap.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y9bz5QMpZAhGP6DR@cota-l14>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
 <Y76nTaoek2kVtLqJ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y76nTaoek2kVtLqJ@redhat.com>
Received-SPF: softfail client-ip=2a00:1450:4864:20::433;
 envelope-from=cota@braap.org; helo=mail-wr1-x433.google.com
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

On Wed, Jan 11, 2023 at 12:10:53 +0000, Daniel P. Berrangé wrote:
> On Tue, Jan 10, 2023 at 10:55:36PM -0500, Emilio Cota wrote:
> > Performance impact on linux-user:
> > - ~2% slowdown in spec06
> > - 1.05% slowdown in Nbench-int
> > - 4.51% slowdown in Nbench-fp
> 
> What do you get *before* applying this patch, if you just run
> linux-user with G_SLICE=always-malloc set ?
> 
> Also what libc impl were you testing with ? glibc or musl or something
> else ?

I've now done a few runs of nbench and the measurements I'm getting
are within noise. So I'd say no perf difference.
For SPEC I don't have time right now although I could do more runs
if you think they're needed.

I'm tempted for v2 to just remove these macrobenchmark numbers, since
with perf we can see that little time is spent on gtree anyway,
and at the moment I don't have time to do proper benchmarking.

Thanks,
		E.

