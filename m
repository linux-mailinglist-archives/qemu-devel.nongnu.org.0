Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A16DEE70
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 10:41:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmW1d-0005es-Ih; Wed, 12 Apr 2023 04:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmW1a-0005ee-86
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 04:40:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmW1Y-00050t-3v
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 04:40:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso12414076wmq.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681288813; x=1683880813;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MfFum8FLEifhXYXGOs4a9LEKaz0A7WO9pe/X0V2mVIQ=;
 b=rB8ZRKdmn5RqCxa7+9jSNI1Sadmgjj23k/xE3uNzJnjDsEtM+wpzVqSfENjyZO2PM8
 ySMAq5qd1dLPdqp3le/ANQ5E9aOwfSa2dWnZGnEevL/Q9OoC9cGIpsMaJlgLE4y1QWT2
 xUhczK/qe8YXBihoLOpqheMRrVqEFDIpDCViPI3kItg0Qp9eQ9sSNiJTLKLuaklEgXiq
 O5c/+2ahwPyfnFHIdOjbl1L86FzG7OTGlFr8SvZTOd0r00Tpv8lp75RayweZ+vD1N/wD
 y/41a4VXvV7R8weVC1o7DuPuqEhguIJtV4vNPUXrIoSDfWwmmHc4qvrg09lwTEfNLhba
 M3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681288813; x=1683880813;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MfFum8FLEifhXYXGOs4a9LEKaz0A7WO9pe/X0V2mVIQ=;
 b=Gd8PPH8cLOdbKEPCA3tB2EoOjpICXSxyZ/UI5Adboou2btFMES9igtwImggqYlv/hu
 n3qK8qN7XAoV/EfA6VMzypTriaZq0I79j7gb10HpmEac1QZVBXad4RZm3nKeWnjBXmiW
 kJhkSsCvn0Fe1B6/j1kNvXULf/P8KkKrtv7Lpb3QLRdr/FdzHhVto9x4UazAWosguPnz
 U0WZ8dT9YD08pmZv7H8GxwrUaD3aOecxI1KStYombd8jU46JxO1TrrY08gjnL+R++j+Y
 jBXcqTLfOGsfgi0xXU1Dh7AKMNYOmYjON0tDVMO+IeNF+qQtvTXe+izzTRYlaCzz2nTS
 psWQ==
X-Gm-Message-State: AAQBX9dwC0NkXax54fxu2HEfEwFtpT2uCONzH5bGrQDHqyVB0cDyQL9N
 eQhtVlQU0BVF4yU7sN3d2kB8GQ==
X-Google-Smtp-Source: AKy350ZAxloM76J0flwAhENkPzRrTtB1KoqMvU01WXUTFbsYBcnaf92xABuEkZ1f0UHTZ7qdA/DVHQ==
X-Received: by 2002:a7b:c5ca:0:b0:3ed:4685:4618 with SMTP id
 n10-20020a7bc5ca000000b003ed46854618mr9422990wmk.34.1681288813370; 
 Wed, 12 Apr 2023 01:40:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c379800b003edd1c44b57sm1568143wmr.27.2023.04.12.01.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 01:40:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAE7C1FFB7;
 Wed, 12 Apr 2023 09:40:12 +0100 (BST)
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
 <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 mst@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
Date: Wed, 12 Apr 2023 09:22:38 +0100
In-reply-to: <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
Message-ID: <87fs95pk7n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 11 Apr 2023 at 15:14, Peter Xu <peterx@redhat.com> wrote:
>>
>> On Mon, Apr 10, 2023 at 11:32:08AM +0800, Jason Wang wrote:
>> > @@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
>> >  {
>> >      const struct vtd_iotlb_key *key =3D v;
>> >
>> > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>> > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
>> > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
>> > +    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
>> > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
>> > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
>> >  }
>
>> >  /* The shift of source_id in the key of IOTLB hash table */
>> > -#define VTD_IOTLB_SID_SHIFT         20
>> > -#define VTD_IOTLB_LVL_SHIFT         28
>> > -#define VTD_IOTLB_PASID_SHIFT       30
>> > +#define VTD_IOTLB_SID_SHIFT         26
>> > +#define VTD_IOTLB_LVL_SHIFT         42
>> > +#define VTD_IOTLB_PASID_SHIFT       44
>>
>> This is for the hash function only, IIUC it means anything over
>> sizeof(guint) will be ignored and not contributing anything to the hash
>> value being generated due to the uint64->guint conversion.
>>
>> IOW, I think "level" and "pasid" will just be ignored.
>
> Whoops, hadn't noticed that guint type... (glib's
> g_int64_hash()'s approach to this is to XOR the top
> 32 bits with the bottom 32 bits to produce the 32-bit
> hash value.)

This is less of a hash and more just concatting a bunch of fields. BTW
if the glib built-in hash isn't suitable we also have the qemu_xxhash()
functions which claim a good distribution of values and we use in a
number of places throughout the code.

> Also, does anybody know what the requirements are on
> consistency between the hash_func and the key_equal_func
> for a GHashTable ? Is the hash_func supposed to return the
> same hash for every key that compares equal under key_equal_func ?
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

