Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBFF44DAF7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:08:14 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDYb-00062j-BO
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDXZ-00053f-GA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:07:09 -0500
Received: from [2a00:1450:4864:20::432] (port=47098
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDXT-0001kd-9B
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:07:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id u1so10887155wru.13
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fEkh+gSBba2Y7/PBrGBZCwqH61+3ErqdqFMNYJ8SBaA=;
 b=RvszwaeQJv7bjztQ1kdqB6psoWr6IjRqOBwmV4mCFGm+nJujmhfeepUx5/GXZ7RWtG
 n3mJkxk+Rf5Ujp2RKdkScMAoiSpLPyJ7L40BKvXhoFndpnvrCcxoAR5yzIJ+5Ojd0LQG
 g+d3T9M1rAWV0QuZ7e8tnz0SE7gCxEExoEoXgzkmLfijl3RwqCzN3Y0CJg/A1xLOMoO2
 HGk40tja1cn/DohOfC6yJnGnzKy+reAtnrX+NNDV/E853812iOtcOL9l+OotRdI/t0iV
 Nx+cntv1dmBbpBiChhdSgb4dkupyBmmU/geAgVLIbeVeZrZuGZYxdG678nxnNITvRYy8
 iNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fEkh+gSBba2Y7/PBrGBZCwqH61+3ErqdqFMNYJ8SBaA=;
 b=6m7gRDz4RYmPbobYndzQaSfW9F5PHF9f4l6PGIMKPLOdV8LXYa5eARsfUNJk3is5Zg
 bzT9+IgIKFzfg8j1gpGy8dLfZ0/a/umKORP0n02rdnnwbvD9X4K8ND9ufoKtutuSb9l6
 F9s7Bg5KiTwNgz2K8Gz4A3CiG76ybbH6osnNi3GAQanMi4o0Bt8mZpX95+i/c/lYCE6n
 nBTiQUZlGYrt+KlkrMHMoB1vvxj9R72RlvTxDG9e1XyZkvCll0Ka+80lTy/tLbyXopKb
 xD5SFnkNa07tUqRLHLLYAO7kyWBQu8a+G2kR9Acn8cFXV6IAoCjEn8lOi55J93CJSloz
 JZng==
X-Gm-Message-State: AOAM5337+nocevfIIYRcuTs/+k2PoEvwMFRN1xoW4brZ9CkAZRucLd+7
 PmqATvKHrYriIiA33HyolTTa26q9ABnmaQ==
X-Google-Smtp-Source: ABdhPJyI5znYC/QqHVSnaACzE+CzkRyMxMFMjgV9MOtdH9VF4yZQqBYjoV2N2mhEarcCw/+pojltzw==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr10223522wrn.218.1636650420622; 
 Thu, 11 Nov 2021 09:07:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 126sm9056363wmz.28.2021.11.11.09.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:06:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C10AA1FF96;
 Thu, 11 Nov 2021 17:06:58 +0000 (GMT)
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-2-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/5] virtio-gpu: do not byteswap padding
Date: Thu, 11 Nov 2021 17:06:54 +0000
In-reply-to: <20211111110604.207376-2-pbonzini@redhat.com>
Message-ID: <87h7ciipu5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
> single-byte field followed by a uint8_t[3] array of padding bytes,
> and virtio_gpu_ctrl_hdr_bswap does not compile anymore.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

