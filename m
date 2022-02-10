Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3BA4B0B14
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:43:48 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6vS-0008Vz-Vq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI6gX-0006Vs-EY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 05:28:21 -0500
Received: from [2607:f8b0:4864:20::1033] (port=55940
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nI6gV-0001ou-Tq
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 05:28:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id om7so4726494pjb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=oudmCHG2iWz3aD8q+0GA6JB6a/rBw0O4lkmO3QS5+as=;
 b=hfaDIeNzBsp3l6XQQNI4UVs3bI3DaQNCrdo30k1eV46VmntwEwQANFdZvh/i6x804b
 AQKvGjZ+DlIDOuAZ1xz8arqMzQLoSigpzYEVQBSKn7zyRa1Edm09SJc2RUHBA/UjGBCd
 2lgt5tVwThZrvVOQ5+HB1Zr2fdp5s2dpVnoBbWY5lCf8uazatziP1wb3Rnd6TZlINTGr
 entr4GNCSrwOtyBymS2sr29hJszfXloZzbVK+75n40v0kMiCWxaBc/TyF3tmfF/SundI
 7NjnKEAXzWyNj460WAj9d0v8sNkuTjqhqZTns74IQnR7paM3AyCMG6Yd+iE0BicGuETS
 W/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=oudmCHG2iWz3aD8q+0GA6JB6a/rBw0O4lkmO3QS5+as=;
 b=ggQzCsUrQIBCOygEdDjmCxnbZB6gtNe+CHsMZiT8LZoAQBqPylUUyNafe00qHufa28
 bCGYo1MHYKV1Tl3ZQpNEN0x1XmsS7b+2/iLiqRt2WnIGc/Gyx/tCnIyz9w8VF3a76ubZ
 xJOUN+xstwlnglY/mFIcGrHMhGyo8kbsgoMWp0kL+/8GJCmSSyijRqcbEP2np+UzsGXT
 lqhZ296PS28VXZ2nKdk8QcaSHz1GDVRZqkJMTUBbJ0IjNltdGoAk9t8lj9weyTQUII4j
 8MjkOr/2pEwq9QP8w1tpDEWqxbD73OnijTmzrEecOkOwqnzNKfM0PP01iJQewcveFzzL
 2LSw==
X-Gm-Message-State: AOAM5315CgwI272r8bqa2MOz0uAZp/+PVB1ySuylXvNY/V+iaBKdlT56
 2UebiDnTh/KteupikEl8A7zajg==
X-Google-Smtp-Source: ABdhPJyM5SF9Iav8V6lEKbEIymZgmyOg3WLk7L2DDji8ki3vY/V2HsQ7orqHi7gFDKMk9ICVScCC+w==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr2006140pjq.237.1644488898323; 
 Thu, 10 Feb 2022 02:28:18 -0800 (PST)
Received: from localhost ([136.185.132.167])
 by smtp.gmail.com with ESMTPSA id 142sm14142896pfy.41.2022.02.10.02.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:28:17 -0800 (PST)
Date: Thu, 10 Feb 2022 15:58:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Message-ID: <20220210102816.vp3dcuh4zmpz2wjj@vireshk-i7>
References: <4f8de2059fc963bb67920a1a2f8481f969a35eec.1641912994.git.viresh.kumar@linaro.org>
 <87czjvdsxe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czjvdsxe.fsf@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10-02-22, 08:29, Alex Bennée wrote:
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> > @@ -113,8 +117,10 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
> >  static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
> >                                      uint64_t requested_features, Error **errp)
> >  {
> > -    /* No feature bits used yet */
> > -    return requested_features;
> > +    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
> > +
> > +    virtio_add_feature(&requested_features, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST);
> > +    return vhost_get_features(&i2c->vhost_dev, feature_bits, requested_features);
> >  }
> 
> It's a bit weird we set it and then pass it to the vhost-user backend.
> It does raise the question of why the stub actually cares about feature
> bits at all when really it's a negotiation with the backend.
> 
> IOW what would happen if we just called:
> 
>     return vhost_get_features(&i2c->vhost_dev, feature_bits, -1);

That works as well.

Also I noticed just now that I haven't added VHOST_INVALID_FEATURE_BIT
at the end of the feature_bits[]. Will fix that.

-- 
viresh

