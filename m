Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09DF4D57B7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:55:44 +0100 (CET)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUVL-00042T-Uq
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:55:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQJ-00054S-4N
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQH-0004Eg-C1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNKyzoVOAZJHjGZsP7prnNaX0dbDLYH8D7NZ2f04t+E=;
 b=QWpwlh6U0P0rIwty4AVSTUHzP6G+ak8lGTNdBctkqkP1yCvzrpk0wOlvpu9QsIkG/2Zz5P
 4Mggx9wey0mmq51prFn0XTCvB2xQ31fQR46TCyNuS52O1C8e7NteW2IvilQcRP2aGNlx0j
 sq34wVXUCrI/D08JT37jIe1l9Ys5Q7o=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-gsvbsAvPPfmve4csGXvKYg-1; Thu, 10 Mar 2022 20:50:25 -0500
X-MC-Unique: gsvbsAvPPfmve4csGXvKYg-1
Received: by mail-pf1-f200.google.com with SMTP id
 a23-20020aa794b7000000b004f6a3ac7a87so4263375pfl.23
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sNKyzoVOAZJHjGZsP7prnNaX0dbDLYH8D7NZ2f04t+E=;
 b=QwaSIlR5AiR8lRlowFnHa5lBs75XQbOgzpnZpJ/rMz9AHJCG4zXzAYf3kE/V36dsix
 6FYRBaTJXC2mxYID4zyurrdiuWmhbFgL6htZ/lCPBjjKU9mEWhC8YQ3rAW808uf9My+h
 fT80+xVEZ2BADR5JAnq1OE3pe4YMlwzLLRJ7TF57SyqDOOPcJb6aRtIL9yUgiHFvI5KJ
 2ETKxDVMuF/8jCFJLGmm4r34Iwd1S/brpsRjYmtzDff0hwjK/Wv5claMzNwSaCfhYToY
 MS3aNajuRQeug2aEbt3oS+OFQixr6vxQgCAYBgbeKa1mEu50+K5RyjEDsnuC4Fm18IB7
 oJjw==
X-Gm-Message-State: AOAM530BpvhcXgXG64fRMEyawR9/p9Y6uLdIQ0yiNowC9iBaMgDN3V2z
 wi0qIo+1iQJZhbqWPJdwKuU78rv6WH3v1GuXbw8S/8eEBnDralU73WHFSp1kj7MveyycLSTC9l/
 6XM10I9IcnVsSF+Y=
X-Received: by 2002:a05:6a00:1902:b0:4f6:ef63:854f with SMTP id
 y2-20020a056a00190200b004f6ef63854fmr7900350pfi.65.1646963424540; 
 Thu, 10 Mar 2022 17:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRMDtkviP5ZS2lKkjVqnLYpwtvWBmDInDlv4F4TjSD0bbd3nzUV+9tmXeRQ8A911EXd4zIVA==
X-Received: by 2002:a05:6a00:1902:b0:4f6:ef63:854f with SMTP id
 y2-20020a056a00190200b004f6ef63854fmr7900337pfi.65.1646963424291; 
 Thu, 10 Mar 2022 17:50:24 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a63e10d000000b003733d6c90e4sm6409516pgh.82.2022.03.10.17.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:50:23 -0800 (PST)
Date: Fri, 11 Mar 2022 09:50:18 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 11/18] tests: expand the migration precopy helper to
 support failures
Message-ID: <Yiqq2siWFshnLUEl@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-12-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-12-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:14PM +0000, Daniel P. Berrangé wrote:
> The migration precopy testing helper function always expects the
> migration to run to a completion state. There will be test scenarios
> for TLS where expect either the client or server to fail the migration.
> This expands the helper to cope with these scenarios.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


