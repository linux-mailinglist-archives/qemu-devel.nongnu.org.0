Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912C3D3C39
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:11:58 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wqD-0006on-Cf
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6woN-0005Lo-HP
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6woL-0007N8-Fa
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627053000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol3eea+Z0gMEwjE2UFl9IUiPCwa++mVWa2eLuvX6QrQ=;
 b=JEB9TARb2DAh/+IyaTrMFbFly19pXOG8rnzEDKSxPhPVSpjdaBoE0fhqeGkjaYBepX7Civ
 KhHCzibpitccjcqJRaPPhbdapxSOBItIUdBfT4t1YipdJhSsXrIXN93AdhIoajbMeKZI2y
 0FvVd+Uh/4bmAvWdN/slmRCgLcG1fUo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-miSgYX3RM8257Ezzm8e4wA-1; Fri, 23 Jul 2021 11:09:59 -0400
X-MC-Unique: miSgYX3RM8257Ezzm8e4wA-1
Received: by mail-qt1-f197.google.com with SMTP id
 l24-20020ac872580000b029024e988e8277so1252470qtp.23
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 08:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ol3eea+Z0gMEwjE2UFl9IUiPCwa++mVWa2eLuvX6QrQ=;
 b=X8NvlQ5kGEhc7ZTNK/0wj1whgkcx+7uebTdF85sxnilOQyvgH0JUEpcRMBJXk2UW7J
 4ZzWFG/Xru8eV8odWD7Ss9AhV82DfKymUetN2gz+iYHtnccHcLTGLSbkjjyTjIGMEy3W
 emRd0crSUDiWoqIKhiWa4GH6NqeiVZxzjRXyKKzxjs0uo8S7ItggEIX2Q/2paGmLB7Rt
 zV9mIuUySbRACCHFHhp3sxejyVGHO18rBpXCCocxoKLND2g8RTJaOa548qNdD2eGGrbS
 QEBXwVZNUMvgMC1h+IZ1tTwAMriDiGB8eZIZHz6oWzbt7jVIssp+G6FsxL6oIZkiIELn
 bU5A==
X-Gm-Message-State: AOAM533xQv/BMA6E09fGoH1Ewccis92OACbHOZcvRwtePqL28vBBFeam
 eFxGhUnNJvcYMNhXt1qzox8je8/NJI+RmA6CQ7A3zIATsCoz+s/7qyHXZRe/+EK4KxAHCJYFx02
 +G4lL81cdRfbklE0=
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr4262189qtc.229.1627052999075; 
 Fri, 23 Jul 2021 08:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF0X+mbVdVhmvTmVy+r8mLyPAnD4jpX6aCPObXy3PwSSEqVXn1ysT0nmk+eYshTrijcc8tEw==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr4262171qtc.229.1627052998874; 
 Fri, 23 Jul 2021 08:09:58 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id m23sm11434115qtq.53.2021.07.23.08.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:09:58 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:09:56 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 4/5] softmmu/memory_mapping: factor out adding
 physical memory ranges
Message-ID: <YPrbxKEY74/5MMiJ@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-5-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:03:03PM +0200, David Hildenbrand wrote:
> Let's factor out adding a MemoryRegionSection to the list, to be reused in
> RamDiscardManager context next.
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


