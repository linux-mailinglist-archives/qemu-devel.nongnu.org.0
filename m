Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53AF6DAB2F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 12:03:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkiv2-0003rm-Hg; Fri, 07 Apr 2023 06:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkiuz-0003mn-Fl
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 06:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkiuw-0001vJ-R4
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 06:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680861721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onRsIsEsKDoRXziPnksBAJrRf0xNG9/A5YLEKz0R/RY=;
 b=NAjLCL2DiuDhpfOZYxeLSXDjOe8vt+9B48OJOvPH4L+1w2hhuL8K1gTkFVV282vD/y+aom
 m8hgzIV7aycLMKJvOdpr/0aemiW1v49tIuUlv6Sz9xiszglyNLZL4EfUyJU41/Gxex+CnK
 qLeSIoTIvg5npNpsFn1UF2t67u8MMLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-BIicMzQaNeyIsxtppmD7-Q-1; Fri, 07 Apr 2023 06:01:59 -0400
X-MC-Unique: BIicMzQaNeyIsxtppmD7-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso13524464wms.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 03:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680861718;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onRsIsEsKDoRXziPnksBAJrRf0xNG9/A5YLEKz0R/RY=;
 b=rGDOi+3eEANbj9ZOo2R0OvugcMgzRzm2cuwpBhnkWCaBFHbcEMJZT2Wbouhz1cI4rV
 OCRmvg1fmH9JOPus300CTAotsUdnMJc5S/mY90SU7f1bvxgkgfcN7kf8KlqgKAvV1dA1
 fuq1Wq3Dlbc7BR2mymP7u8v01zJhcxQYF46ZUc1tgMRdeZyt133qZ2kVJkN2zz08hOnt
 AMokgh2hqM4XI0FL08TbpgyhKyCrufKWhtRoxQgkyT15usNMiGEuS6AgvUiJaBn9GnI0
 QNaatNY3Xyh+uDOYUfqbjYVehRI35FeeUopSyos6/R5+IdibD5jB4VSv8IdN/cpOdZ1h
 QpZw==
X-Gm-Message-State: AAQBX9efaenlJPobU49NjyQ91Zsqh4mr7rtcrzd+Yv+NATxvEx2PK7+S
 pjJVqOZh2qf6c/PAFksbHuSmj/DJttSE2Q49GSIcrTUHp2qQ0qn3WQJJcEJGnFqFQS46H77Db/A
 NRV2qJOxYHX3CaWk=
X-Received: by 2002:a05:600c:2247:b0:3ef:62cd:1eb with SMTP id
 a7-20020a05600c224700b003ef62cd01ebmr894962wmm.7.1680861718382; 
 Fri, 07 Apr 2023 03:01:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YyMNJrX/LhEA3vI2FnqzThL50jMlKkYCAG8XKR38jNHGww3S74N+/mnsg363I0Bm2L1g05UQ==
X-Received: by 2002:a05:600c:2247:b0:3ef:62cd:1eb with SMTP id
 a7-20020a05600c224700b003ef62cd01ebmr894947wmm.7.1680861718073; 
 Fri, 07 Apr 2023 03:01:58 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfce85000000b002c54c9bd71fsm4144793wrn.93.2023.04.07.03.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 03:01:57 -0700 (PDT)
Date: Fri, 7 Apr 2023 06:01:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
Message-ID: <20230407060016-mutt-send-email-mst@kernel.org>
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
 <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
 <CACnJMqqte0Y7_SJt9Q3_ZVaj3=46tqNS6EPfp_gg91B_J3VD4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnJMqqte0Y7_SJt9Q3_ZVaj3=46tqNS6EPfp_gg91B_J3VD4A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Apr 07, 2023 at 11:47:50AM +0200, David Turner wrote:
> Digging a little further, the top-level meson.build for qemu has the following:
> 
> 
>     if targetos == 'linux'
>       add_project_arguments('-isystem', meson.current_source_dir() /
>     'linux-headers',
>                             '-isystem', 'linux-headers',
>                             language: all_languages)
>     endif
> 
> 
> But this does not carry to the subprojects (and there is nothing equivalent in
> subprojects/libvhost-user/meson.build)/
> If I change the above to use add_global_arguments() instead, compilation
> succeeds.
> 
> I don´t know if this is going to break other things though, but I'd be happy to
> change the patch to do that instead.

Or just add above lines to libvhost-user. That's probably safer.

-- 
MST


