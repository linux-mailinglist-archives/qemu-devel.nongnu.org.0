Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCF265EB4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 13:21:01 +0200 (CEST)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGh6y-0003mX-Qe
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 07:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGh63-0002hK-VD
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 07:20:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32204
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGh61-0007jY-SR
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 07:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599823200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOAdjQd1E4oybISznXyMPWv/Wds3ZgWsYJfdM9+5wCc=;
 b=iIU/6aYNUPQ0eUm6uyb1bckafqNH+WZharLFSLAG7r4+aw9OOZud8H3FPvh6ir8au9BmFu
 8aIX7CssBVVLHfTisOBGXFKTssZ3XI6KU4pdihmnKigDqq9/FggyyPITz1Sz+TRwLjhPZV
 sF7tj/UyE5Vp28uKn2ghPs5S5mcvIRQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-8PmuGp5pM6WGPy1OF70cJA-1; Fri, 11 Sep 2020 07:19:58 -0400
X-MC-Unique: 8PmuGp5pM6WGPy1OF70cJA-1
Received: by mail-ej1-f71.google.com with SMTP id m24so4431122ejr.9
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 04:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=KMiqRhel0g5IBcIbtpFGwC0bau3VdayI3G4+Jq4O3n0=;
 b=HfzbnLa5YA2eIvkV7eQzA0OdqfeK0bkeVH4Yz0lQ4FRvi9OVo6GKMcxe0KxgbYaJvV
 udYY4EZTToSDDOaF9wJKtXAfY13i+/umBpD0HKn2U65SSOgwHwmALnyM2B8KAl57GJ/1
 P7rbyoDT66yXCuisvbk2JTttHShEyl5RLsS8hlJgHHSaJmrXDQZZaFBIhL59tFVw/UC2
 VtUzLgunqkyY5rqG4LcIsvTcFWh8gpE0eocS8eA0kraxPIKK9X9rTMwNyij4wj7OCiTx
 PBdSeFkfmiBbDBjT31XngRfLxEJPpKEW/vdGBH3uCmj++EYOjsc367mT+JfUtkGR8HdJ
 AnCA==
X-Gm-Message-State: AOAM532s98decadC4DjFj5OjbnF024fWMGqwqM42LLgWFxwz67RKtaNE
 f2u6p1ai3ytOTmeG2nsZlBk7cHjlOu93mEUYAlIv/s71lMs/DwoGQkqcnYk11wkB63OHGheE9ZA
 N7DGlSklzReIeaq4=
X-Received: by 2002:a17:906:cf9d:: with SMTP id
 um29mr1538091ejb.74.1599823197104; 
 Fri, 11 Sep 2020 04:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsTzhQq0fRKrMLBF7/Svrv0/bDX4L1VtlSZvPzXcwihEY7X3iaBjEFYaLdkZGyBvV99ijeIw==
X-Received: by 2002:a17:906:cf9d:: with SMTP id
 um29mr1538074ejb.74.1599823196931; 
 Fri, 11 Sep 2020 04:19:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5568:7f99:4893:a5b6?
 ([2001:b07:6468:f312:5568:7f99:4893:a5b6])
 by smtp.gmail.com with ESMTPSA id a5sm1436769edb.9.2020.09.11.04.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 04:19:56 -0700 (PDT)
Subject: Re: [PULL v2 01/46] qemu-iotests: move check-block back to Makefiles
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20200906175344.5042-1-pbonzini@redhat.com>
 <20200906175344.5042-2-pbonzini@redhat.com>
 <98f7869a-cb45-08b5-670a-ebc47254b0c2@redhat.com>
 <42d1edc2-228b-220c-8db8-251cb83c964b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9eabd611-8885-3569-3b14-3654a1e5c7fd@redhat.com>
Date: Fri, 11 Sep 2020 13:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <42d1edc2-228b-220c-8db8-251cb83c964b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tbwOX9lUTBjgydmr8Ec8U0TuliS5iTba4"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 00:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tbwOX9lUTBjgydmr8Ec8U0TuliS5iTba4
Content-Type: multipart/mixed; boundary="ZHCmFN4Vhapnu5NIAfLMjl5AfBGFWYtgi"

--ZHCmFN4Vhapnu5NIAfLMjl5AfBGFWYtgi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/09/20 13:05, Max Reitz wrote:
> On closer inspection it seems like it=E2=80=99s because of the
> =E2=80=9Cbuild_by_default: false=E2=80=9D, which seems like a rather cons=
cious decision.
>  Was I only lucky that the socket_scm_helper was built by default so
> far?  Should I have explicitly built it all this time?

Yes, you were lucky but that's not a reason not to change it.

The problem with touching a whole build system is that you are not going
to test everybody's usecase, and yours is definitely reasonable and not
"M-x butterfly" territory.

Paolo


--ZHCmFN4Vhapnu5NIAfLMjl5AfBGFWYtgi--

--tbwOX9lUTBjgydmr8Ec8U0TuliS5iTba4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl9bXV0ACgkQv/vSX3jH
roObCAf7BkXXn4tFKHb5xrH/n1DcpbY3y2sJysvdExliZPWYDG/NTw3L3NaFS/5v
T+dK241ZOrtp1ZjApkcjCatPiFnmKjJPFV6SP9qbSOUOYfB/2gtHO69GQ1dwhdst
Pgb2gcc+IiTZ0W1rL16zvLCaI0zDePBWDPW+XU/rTZ2iUIPhFxMZU+ooKKsaZWPJ
V4MFkQoPszORKSzGCJef2VZr7z3IwJ5TmFhlT3+zJqi2L1nEJuxYn2BL+dwWLSfP
xiCtpEfrowGsU+rUAEtEGym1GmnFXofJ9eh6GYXAQ2lfoxf4ZPFPbZgxMq7e2Sju
MhhjDI0sL0fOTNQhYFzBlMeMbqxVbQ==
=Xg1k
-----END PGP SIGNATURE-----

--tbwOX9lUTBjgydmr8Ec8U0TuliS5iTba4--


