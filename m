Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72F30F118
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:45:46 +0100 (CET)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7c8v-0000v6-L9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7c7z-0000Qp-Es
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l7c7u-0003UY-PG
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612435479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcFgKjaA2RDFYeupqM2OOSm1g/C6/4Y3IwpDhxM+RXs=;
 b=N4mr7Cid/tXVgb8WqXhVuab2Fpd/F8+UMCGVGO28JgoXzPRruetNmC3tuzjPAHr1l+ORHw
 DOzDpGFNTAp/lt96Zzxq6m6l13U43aeqBMjELyax+xJHlxvH+Q0MR4mia0raq0UI6oOA0I
 0aVKE5tnkZNpyAEBJjCbN32TYEKyUmI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-66_YRbdPMCSwlcJhbLwDyg-1; Thu, 04 Feb 2021 05:44:37 -0500
X-MC-Unique: 66_YRbdPMCSwlcJhbLwDyg-1
Received: by mail-qt1-f200.google.com with SMTP id o20so2189231qtx.22
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fcFgKjaA2RDFYeupqM2OOSm1g/C6/4Y3IwpDhxM+RXs=;
 b=jF7zEJYhfWenKsgDn/epxMcnD7u7kZqqTprZ9SQJpDOgxhbabqF1xdCtPaeJOFLIid
 4RHLomRY4ZGJaP59Lv21MyRGLw5rfnjJg+ouxxkWGnTH+Uwg+FbYSJucuiugK7AByykl
 Af3ra8wNLl6sZamL1kdXi4ezKU43a+Wu+jpThtLpreInPUh2LsvtG+a1cMq1W2zRaEly
 wpY8rao7cNJEqdfcV7aMQtov7eTV5W9Xg15wxMxYwEReETruV7lKHet/gbtDBWibm5Z2
 XRkrtMneGVpVl9MbWaU42mGyBpCM5O/azbl9yc33g+Z2n6V2wc+aCEPIK+L4zBtBexXz
 795g==
X-Gm-Message-State: AOAM532vCIOKmsArlkypWPMkAfqfvPETOZfkFFP6aqcPNchO1zwzq+pB
 kniEkXLa+R9Lo/ADRwRVPF+vtRhpEIcht0GZUik6jCkTdXWuzDectBqbemsZtJBsh8AKXHToWrK
 ovtgmJAoQfB+K3Wc=
X-Received: by 2002:a05:622a:347:: with SMTP id
 r7mr6029093qtw.279.1612435477414; 
 Thu, 04 Feb 2021 02:44:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygut69bygt39wN+U5ogUzDP6PqezJl67/9gIc9PRfEt/aKxac32GdIduOaBSnhA4Qxp+6Cpg==
X-Received: by 2002:a05:622a:347:: with SMTP id
 r7mr6029079qtw.279.1612435477249; 
 Thu, 04 Feb 2021 02:44:37 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id q6sm5055726qkq.34.2021.02.04.02.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:44:36 -0800 (PST)
Date: Thu, 4 Feb 2021 07:44:34 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 01/22] tests/acceptance/boot_linux.py: fix typo on
 cloudinit error message
Message-ID: <20210204104434.3o4h3qy7yz6n3xmi@laptop.redhat>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-2-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 12:23:36PM -0500, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Beraldo Leal <bleal@redhat.com>


