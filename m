Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E31E67540C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIq4g-0006wT-2D; Fri, 20 Jan 2023 07:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pIq4d-0006vr-0o
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pIq4b-00033N-KX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674216044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j2oKxstBMt2dys53+Gz34pT6e2xzFXD9H32SKo6hObo=;
 b=imdpzRrVYVxxDQ7iCXfKrv+rXZ8bTwh27yUSLhiay3WlPQh5YZCszqtJx+IN6WeMrCbgej
 QbACCfIy1Posdd4wDcBXkbnG7OgMZFMSwkQUrKqtX9SnGrkgsgKRCnAL/4Uw6RtACUwyDF
 ZSqdE8KDMuTf0ZdO9lMBj7+3ZKB0Pag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-VJk14Sw_POuWekKkOmZ4uA-1; Fri, 20 Jan 2023 07:00:42 -0500
X-MC-Unique: VJk14Sw_POuWekKkOmZ4uA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CAD085A588;
 Fri, 20 Jan 2023 12:00:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BA939D93;
 Fri, 20 Jan 2023 12:00:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
In-Reply-To: <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
Organization: Red Hat GmbH
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
 <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 20 Jan 2023 13:00:37 +0100
Message-ID: <87wn5hh0uy.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Fri, Jan 20 2023, Thomas Huth <thuth@redhat.com> wrote:

> On 19/01/2023 14.54, Fabiano Rosas wrote:
>> QEMU machines might not have a default value defined for the -cpu
>> option.
>
> Which machines for example? ... I thought we'd have a default CPU everywhere?

There's a patch further above that removes it for KVM on Arm... do you
think that's a bad idea? In that case, I'm not sure what the default for
that case should even be...


