Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1D6864A1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAHj-00062F-Tt; Wed, 01 Feb 2023 05:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAHh-00061h-JH
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:09 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAHf-0001pK-LE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:09 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t18so16839208wro.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULpkeHQYGtPXA6Mh5EfnBYgu1mf6Tl1ke1nKOLOm/n0=;
 b=HpQjODsWXf4PYBEGRyF+qsyA3wdp8DQeBkNMcHs+kFyF3ccMK0p9BVuWnocc6xDXTK
 kIeW/yRLrt057+vUFJG5mNfTON7apMvghR0FCkVp56K4lUGNldxgjy7r7Yt/ZG1ce71h
 9n3hmrs8jqwMqdLq6MMrqYJurYX6icALKxOXcv+RU/jjPmZijpYCAiML1o8E3CCVFb82
 gaN7cUkllNhFdTBVKZRn4SlQR6B/25Zy6/lkayntmTngMmBzDRh2BoRmxdtfysyNbRQa
 M3f92M3bXqNNZ4NktwfReZ8m7WVGTsVWQ3nCNm/A9tcKVJ4HeuaqnnJ7GdcnKkT1CkDh
 uPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ULpkeHQYGtPXA6Mh5EfnBYgu1mf6Tl1ke1nKOLOm/n0=;
 b=xDGWaIq+X5HJfPlcLpYdL9LB3ih3KsJZnRuLg2+xJ/ev3r3CCqriMb52gnm06mTsB5
 pMlE53m2RCfl8wAE/fBCWXqAfaLYabCnmLdvQMexGM0ejLN73X0pmbh8vFO/Wbvkt/f/
 5hEQ/DJka3Q40dA6YP2HbCTH80eeABAipTKMEn1rwhlLbGK4Tg9/czNaNRlhd87Lqd+i
 Bk96avr5pz6LJgNlObPcx/cjsFM5NOaSEMSTn395LB7Rj40iMWR5Ady923wVOEZah+BA
 1PwGt6ATStT2mRrGsSDdycYtdQ388nnuMWBxtmYRstdLQGZqglUF55MPyyy7ZwBW9AOo
 6Mtg==
X-Gm-Message-State: AO0yUKV1+D+jwY8mUyifSk4wTrr+7iUyT5RSdVVUwl5cXXr4yMIkZXf5
 Qc77JD7z0JTHPPs/vYoc1rzoJw==
X-Google-Smtp-Source: AK7set9F8DMSVOpQvkoWjkAZLMZWqn3Dyj9Q21LY63JGmosSuYLHX+ubxTfk5v7zdDyx2b7KGKEcRQ==
X-Received: by 2002:a5d:6850:0:b0:2bf:e443:ea6e with SMTP id
 o16-20020a5d6850000000b002bfe443ea6emr1659287wrw.57.1675247045808; 
 Wed, 01 Feb 2023 02:24:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d4284000000b00241fde8fe04sm16843870wrq.7.2023.02.01.02.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:24:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D06BA1FFB7;
 Wed,  1 Feb 2023 10:24:04 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
Date: Wed, 01 Feb 2023 10:22:32 +0000
In-reply-to: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87mt5xsmyj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> ---
> The Free Software Foundation moved to a new address and this file referre=
d to their old location.
> The address should be updated and replaced to a pointer to <https://www.g=
nu.org/licenses/>
> This will resolve the issue #379 in the QEMU source repository

For next time I would put this comment in the cover letter. You can also
add:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

to the commit message to auto close the bug once this is merged.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
>  hw/sh4/sh7750_regs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index beb571d5e9..94043431e6 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -22,8 +22,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>   * General Public License for more details. You should have received
>   * a copy of the GNU General Public License along with RTEMS; see
> - * file COPYING. If not, write to the Free Software Foundation, 675
> - * Mass Ave, Cambridge, MA 02139, USA.
> + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
>   *
>   * As a special exception, including RTEMS header files in a file,
>   * instantiating RTEMS generics or templates, or linking other files


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

