Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EC6B6038
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 20:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb4tK-0008QF-8B; Sat, 11 Mar 2023 14:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb4tI-0008PW-6v
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb4tG-0003g8-Md
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678562905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7XHoCGtuSnMa/aJBKnvHHObzRB44rWPBs6WD3Kn4vM=;
 b=GMU+GY2puURLp3tD89/mzG5HD86FlmZ5nEdmUJpmIzGoxslMyncll89yTOrSxCe9JvCq79
 0rfxT1VWBnrM3a0/5nrlDliYml1J2Ssu5t7huo4o67Y+K6JGGi0fiDUnPaERfv1vbEBKuq
 v0Ypf+H7zcFEuLdkFge3eM8fcyPjbzw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-TkjKIeARMD6ka4TMfjipRw-1; Sat, 11 Mar 2023 14:28:24 -0500
X-MC-Unique: TkjKIeARMD6ka4TMfjipRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so5496792wme.9
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 11:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678562903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7XHoCGtuSnMa/aJBKnvHHObzRB44rWPBs6WD3Kn4vM=;
 b=QvFKHf2buM8AXF/VbUiIEIC5aqNrBq4QY/dvOjOMXWt/VnNxYkKxXd2e3MZNdV+MKF
 OX2wk/lQ9U186LCBgFtQo/uU086V6KpiJzmR3FaibgFO2D10mLcsBWeki0joLPtJs2M8
 KM6y/53Z2K/EUKXjYVOqbR0v6hfsOqCzSdiZaKBhBquQx9K7L1IBW7Zo+yqFnzWD2JIr
 zlDsSYbUNPjv32VeOy8VX7DwO5Xzf3vnk9ftYzAPv3L8CmR6yp2e8pIYZ5JQ9tNSO/6C
 /CkwoWfjmZCx9lMLnUTiPVpnhsIauNfDo8YDraNgUhUyFdWKlUdhVtGX38/qgq9DR3Z7
 1wig==
X-Gm-Message-State: AO0yUKUvwdRlYoRoFrT5JWjt0xb57vYebMJ4wAzOtpmgAwMYzmpCiaoR
 qr4F47MKD3AWJJxbD1H0EA62qLPHKQ8wADdvbnL6wT7IWYQkh/8QH7ivFrbuRx9zUkh1OFyEdq8
 fpYJSZOv2/u4xRYg=
X-Received: by 2002:adf:f58b:0:b0:2cc:4dac:fe3e with SMTP id
 f11-20020adff58b000000b002cc4dacfe3emr20331980wro.62.1678562903213; 
 Sat, 11 Mar 2023 11:28:23 -0800 (PST)
X-Google-Smtp-Source: AK7set94vSqErO8dag0eEM04pKOq0j36XAfcJeHFilOgLz45nMy1Or6cPL6WzuX7bjNQ2mQS8OpHJA==
X-Received: by 2002:adf:f58b:0:b0:2cc:4dac:fe3e with SMTP id
 f11-20020adff58b000000b002cc4dacfe3emr20331961wro.62.1678562902926; 
 Sat, 11 Mar 2023 11:28:22 -0800 (PST)
Received: from redhat.com ([2.52.29.35]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d4a8f000000b002c70e60abd4sm3164093wrq.2.2023.03.11.11.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 11:28:22 -0800 (PST)
Date: Sat, 11 Mar 2023 14:28:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230311142752-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050853-mutt-send-email-mst@kernel.org>
 <87edpweo4q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edpweo4q.fsf@suse.de>
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

On Fri, Mar 10, 2023 at 10:23:33AM -0300, Fabiano Rosas wrote:
> > How about a special make check target that will just test
> > xen things?
> >
> 
> Probably overkill for this particular issue. I don't see any
> Xen-specific tests yet. It would run almost the same set of tests.

Well, a subset for now.

-- 
MST


