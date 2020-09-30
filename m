Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEC27F0B8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 19:49:27 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNgEI-0004b0-EA
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 13:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNgDD-00046K-Oi
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNgDB-0004dm-60
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:48:19 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZvrSnYm3YGfZv/jW9MTku5rvnXBGTL6dfq7Gux/9s4=;
 b=HfcUr0Wp8hLPuP9gTqI58f8/zPD+hhfrN1IlQPAIvArINkHM9zHJh7iBqLkFUVUpbw3BmS
 uXnim+t7xzpJlbAV2YxumfiDZEnkqXq3gfvnayhgbLI8yCiXWu/5gCO+fQpMy8qOOJMEhA
 n9/yDPb06LpV6hodGukORk6wF1wmLA0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-WbLnaRS3NGWnq-o-pL1rsQ-1; Wed, 30 Sep 2020 13:48:13 -0400
X-MC-Unique: WbLnaRS3NGWnq-o-pL1rsQ-1
Received: by mail-wm1-f70.google.com with SMTP id b20so275474wmj.1
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 10:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=3tY4UGEihUG/tvZ5JYGwPtvK29XTRCAmKkYZxpL5Tuk=;
 b=O7RmhXl5nBbcUN58l3cKQPULbAvFkUPBT1HeMvyXZCbbhdEL98Rs90HEAOXRwJroyP
 t2MNI3pEC+6vq9iD5BH15hShdyxq9GH0HuSWkk4y931ub6lxvHNQsiSueMATlf5JV9CG
 jrSUudO0j6l3dkjmyY3RtpoW3Dbey7Yv3SquLTSF3hX7rUSOGotqc50+FcpEOkF6Ne4o
 j7oir3cqcbyJa1/XEuCj3ChUUuhjIk/dCxk91FeL9kS2Sv1HSuVScL2fcrplG3UVIdDw
 DOBMKAt0qF8IYeH83BmqBhBG01LCqLavBZqqI1Drt8Bnut/xr/9NBSNBpYCUEBj3bLaQ
 Mc4w==
X-Gm-Message-State: AOAM5332nnHmOUaH5dLch/9sL3PwGqskE+PeE/1vdZphrkW1cGso8SKe
 4LmnLAoShIVvw0gt8JJKUYqB5t/TKpdEM1wWyaHJinaPb0pmmVCwIxsIKMqWa3gGrHXrEEc04Ee
 QaKLWLGCcXajhFIg=
X-Received: by 2002:a05:600c:20c:: with SMTP id
 12mr4461380wmi.40.1601488092007; 
 Wed, 30 Sep 2020 10:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq60XVfELMyIc5OByeHIYXZieFql7TrKd4z75H2KFxG7VYX0LkNBD7qJaNImn4ITWDKjBw6A==
X-Received: by 2002:a05:600c:20c:: with SMTP id
 12mr4461367wmi.40.1601488091800; 
 Wed, 30 Sep 2020 10:48:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:75e3:aaa7:77d6:f4e4?
 ([2001:b07:6468:f312:75e3:aaa7:77d6:f4e4])
 by smtp.gmail.com with ESMTPSA id z67sm4454538wme.41.2020.09.30.10.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 10:48:11 -0700 (PDT)
Subject: Re: [PATCH 01/10] qdev: add "check if address free" callback for buses
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20200925172604.2142227-1-pbonzini@redhat.com>
 <20200925172604.2142227-2-pbonzini@redhat.com>
 <20200928093006.GB44353@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ce4b7050-24c3-8d68-8e37-3f12c3970cac@redhat.com>
Date: Wed, 30 Sep 2020 19:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928093006.GB44353@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wQZpsgONexfsOiSxOfOIJSF51MJnzbQ7s"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wQZpsgONexfsOiSxOfOIJSF51MJnzbQ7s
Content-Type: multipart/mixed; boundary="7e0Av3VYWFPr8VwStkFYckFwuNenv4bgA"

--7e0Av3VYWFPr8VwStkFYckFwuNenv4bgA
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28/09/20 11:30, Stefan Hajnoczi wrote:
>> +    bool (*check_address)(BusState *bus, DeviceState *dev, Error **errp=
);
> Please document this function.

I will add this:

=09/*
=09 * Return whether the device can be added to @bus,
=09 * based on the address that was set (via device properties)
=09 * before realize.  If not, on return @errp contains the
=09 * human-readable error message.
=09 */


--7e0Av3VYWFPr8VwStkFYckFwuNenv4bgA--

--wQZpsgONexfsOiSxOfOIJSF51MJnzbQ7s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl90xNkACgkQv/vSX3jH
roM6swf+LZjZ8ma1gPB4Nni92gDHFHCNuCwyS3dh7hRPc6mCq9qEvPQuODxt0qP9
2o6KOX+QUZHvU4Fy2QW54LeHFLNvlRCcz0CX3wz/bAahsOkBPWQ+j0r/igPio753
FPxp68ZvyF2nWeSr+YWP9AETIwKkuQjJIKrNGISAt7rt99TgPpM5V1/84pZzpdPI
gWR9lK8M7Qnlx862nbLw0hHrfUepKFmtLph8QbKyjbciOxqiowYCPfMGPHAq7faA
qexuDYt9b1oJ5+JiRKkgfSGCdkT/PIzYkMqd2DhTQybE22XWQLcp+WZK9dkxkl6t
2ZoT2ozLQK+7AtvYmfPutePoM0GR7w==
=ey7L
-----END PGP SIGNATURE-----

--wQZpsgONexfsOiSxOfOIJSF51MJnzbQ7s--


