Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E04D57A9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:55:11 +0100 (CET)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUUo-0002yy-7K
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQa-0005sr-IG
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUQZ-0004LX-1E
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp8KfnTo2ZLSk7+E3HhGrg7/HRymaiT8nojI1kFJm8A=;
 b=KedcE+PmIQRjuN8AUKsg6uScwWL4WXe0x9hiN6Yrep3G2JAuLSw24mtMR/A0PVP4fJ8en/
 GSEt3L2MOx71F2WIFgjlwfP2m88DUa/4V8UkiZ7Yek5quqfv1CfMwtDYyUgmmttR18jQZ4
 2D8q4iSVZCBMQxXYxb0V3ZSE0G9ugqY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-Xnx5hQZOOKitVklNvAcVBQ-1; Thu, 10 Mar 2022 20:50:45 -0500
X-MC-Unique: Xnx5hQZOOKitVklNvAcVBQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 q7-20020a63e207000000b003801b9bb18dso3896156pgh.15
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sp8KfnTo2ZLSk7+E3HhGrg7/HRymaiT8nojI1kFJm8A=;
 b=fe8AIyTBtqXNvcLPkt6TkNPnEdB/eNEpZiWy8Mf/KAgvqP6r3B1O+fhpdfTlINyNOD
 claN2k/f+f/QGzohR9CVECMndBYl83qcbj4TXbdOILnhfqSo4+kRlFskBcNRwnHPYZBg
 sV6QyaV+ctXv0arR64foyz9URsea8HcTsfHkyAnFlITUMlJn5k4OC0tm96HHIEZLUXy6
 E2oMUDp2FDcI0KRSnJqwuQliDpXpoSnbzUt/BnMZHDiaeAndg4yQbAgQ320pxMDLMSJw
 K6xpETt6/ab2F2wwLLqdI0EjVgZnIiW8xFlnK8A2Hz5Ek46BjCKP3kXw5UU+9DHFPkkF
 Yu6g==
X-Gm-Message-State: AOAM532L9LF9gYogHaBL/X1II0TcQWHg+tyF5kRESlgdj0wmm0wGiSQL
 aah1GW7DPAxskpTDxqxdqQRys5ChzT8TEW1A30btSCFCxC8g6fkzTrmHIUrxL2mSnsCfiAsr69V
 /HXWJBq57xG2f11I=
X-Received: by 2002:a62:e918:0:b0:4f6:fa31:ba09 with SMTP id
 j24-20020a62e918000000b004f6fa31ba09mr7861842pfh.6.1646963444157; 
 Thu, 10 Mar 2022 17:50:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4aBd5UB9RvRLV8NraYxe4G4IrbEO0MrocXQiykDRjkScKs+RQ33Fb3efBeuOdH2j20/eRHw==
X-Received: by 2002:a62:e918:0:b0:4f6:fa31:ba09 with SMTP id
 j24-20020a62e918000000b004f6fa31ba09mr7861825pfh.6.1646963443926; 
 Thu, 10 Mar 2022 17:50:43 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f75d5f9b5csm7416646pfk.26.2022.03.10.17.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:50:43 -0800 (PST)
Date: Fri, 11 Mar 2022 09:50:38 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 14/18] tests: convert XBZRLE migration test to use
 common helper
Message-ID: <Yiqq7mq8LWreWH/8@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-15-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Thu, Mar 10, 2022 at 05:18:17PM +0000, Daniel P. Berrangé wrote:
> Most of the XBZRLE migration test logic is common with the rest of the
> precopy tests, so it can use the helper with just one small tweak.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


