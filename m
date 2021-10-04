Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91C420AD6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:21:58 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMyi-0001qE-0R
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXMqO-0001hF-2r
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXMqJ-0000jQ-7e
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633349590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJGw7GOp04SC/YzdcdFtNnR0Wyclo3gafAV0NFsplv4=;
 b=D+htCp5pv8X/UtWk1mznMtYHZVvC/ueX9oyJ40RoV85vcSuHIspV22ZzH6YEt/iLYz9HGn
 ZBFCRAodOupyDPqpL+QQT2St2ZqrAtcnyufdav435Ru216DyrObj4PPsvimBFE59Xo+s1H
 wj5oJZva4dL4R0EX/xha/2K3LS1GLz8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-SnqUuqTkOJ6Jv-m4hto8NA-1; Mon, 04 Oct 2021 08:13:05 -0400
X-MC-Unique: SnqUuqTkOJ6Jv-m4hto8NA-1
Received: by mail-wm1-f71.google.com with SMTP id
 129-20020a1c0187000000b0030d4081c36cso4074092wmb.0
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 05:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hJGw7GOp04SC/YzdcdFtNnR0Wyclo3gafAV0NFsplv4=;
 b=Fjx1fheEOBW1McudVHnti9l1xZR73C9rFyWG6VvvVgNT1JUvYYrAFBLWXNgZEzN+r5
 3t7zdaVhsv6n7yHA2QAb4RMPTotxsVXYIvk8od/8VXQ6JlP2kmsU1F+qC1epOcVpEDaA
 tKjPTe0dRrtnzI+ztQbjHyj2li+bQe59JPtZraMSji6tUYZ+sWUVTzt7yQlfrErAw1Yp
 7aFfX+fZEJ/JdkfEdNBJOLW37O/AitsisI9iI+uab1ad7gPRlLFXEu9bRcaHxjnpvkfk
 o22Mb40gPHmdZRt6A73COsxoG6Tp4hwn6d4oti0abfH7dUPdT/dc/ZMfkCkFY9a1um16
 xNMA==
X-Gm-Message-State: AOAM530SMd2i0CVCmbB1A6YQDkLSZQr8ER2o+iWPHnfPDstkKqWMjRou
 rOXemYTkxOUpc9oeNULcdvJ6+kX/WQ2MoCNXRnO4VFx7J2NUFnFiItS+r1xzfuYSwk5TOqVVpKe
 L/O1b7eK0X2IpwzU=
X-Received: by 2002:a7b:c351:: with SMTP id l17mr18284923wmj.120.1633349584338; 
 Mon, 04 Oct 2021 05:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPtaPkDwzFqu2dYnBSrjAx2w5wBcOwdCRs+utz0z8NAJk7Tb6gmG0CIJrsP217A210PnFIjw==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr18284891wmj.120.1633349584093; 
 Mon, 04 Oct 2021 05:13:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z17sm14344243wrr.49.2021.10.04.05.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 05:13:03 -0700 (PDT)
Date: Mon, 4 Oct 2021 13:13:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 03/19] docs/devel: document expectations for QAPI data
 modelling for QMP
Message-ID: <YVrvzKpFHWqv/cim@work-vm>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930132349.3601823-4-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> Traditionally we have required that newly added QMP commands will model
> any returned data using fine grained QAPI types. This is good for
> commands that are intended to be consumed by machines, where clear data
> representation is very important. Commands that don't satisfy this have
> generally been added to HMP only.
> 
> In effect the decision of whether to add a new command to QMP vs HMP has
> been used as a proxy for the decision of whether the cost of designing a
> fine grained QAPI type is justified by the potential benefits.
> 
> As a result the commands present in QMP and HMP are non-overlapping
> sets, although HMP comamnds can be accessed indirectly via the QMP
> command 'human-monitor-command'.
> 
> One of the downsides of 'human-monitor-command' is that the QEMU monitor
> APIs remain tied into various internal parts of the QEMU code. For
> example any exclusively HMP command will need to use 'monitor_printf'
> to get data out. It would be desirable to be able to fully isolate the
> monitor implementation from QEMU internals, however, this is only
> possible if all commands are exclusively based on QAPI with direct
> QMP exposure.
> 
> The way to achieve this desired end goal is to finese the requirements
> for QMP command design. For cases where the output of a command is only
> intended for human consumption, it is reasonable to want to simplify
> the implementation by returning a plain string containing formatted
> data instead of designing a fine grained QAPI data type. This can be
> permitted if-and-only-if the command is exposed under the 'x-' name
> prefix. This indicates that the command data format is liable to
> future change and that it is not following QAPI design best practice.
> 
> The poster child example for this would be the 'info registers' HMP
> command which returns printf formatted data representing CPU state.
> This information varies enourmously across target architectures and
> changes relatively frequently as new CPU features are implemented.
> It is there as debugging data for human operators, and any machine
> usage would treat it as an opaque blob. It is thus reasonable to
> expose this in QMP as 'x-query-registers' returning a 'str' field.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
> index a973c48f66..0f3b751dab 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -350,6 +350,33 @@ In this section we will focus on user defined types. Please, check the QAPI
>  documentation for information about the other types.
>  
>  
> +Modelling data in QAPI
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +For a QMP command that to be considered stable and supported long term,
> +there is a requirement returned data should be explicitly modelled
> +using fine-grained QAPI types. As a general guide, a caller of the QMP
> +command should never need to parse individual returned data fields. If
> +a field appears to need parsing, then it should be split into separate
> +fields corresponding to each distinct data item. This should be the
> +common case for any new QMP command that is intended to be used by
> +machines, as opposed to exclusively human operators.
> +
> +Some QMP commands, however, are only intended as ad hoc debugging aids
> +for human operators. While they may return large amounts of formatted
> +data, it is not expected that machines will need to parse the result.
> +The overhead of defining a fine grained QAPI type for the data may not
> +be justified by the potential benefit. In such cases, it is permitted
> +to have a command return a simple string that contains formatted data,
> +however, it is mandatory for the command to use the 'x-' name prefix.
> +This indicates that the command is not guaranteed to be long term
> +stable / liable to change in future and is not following QAPI design
> +best practices. An example where this approach is taken is the QMP
> +command "x-query-registers". This returns a formatted dump of the
> +architecture specific CPU state. The way the data is formatted varies
> +across QEMU targets, is liable to change over time, and is only
> +intended to be consumed as an opaque string by machines.
> +

Are they required to do it this way - or are they allowed to define x-
qapi types and do the formatting in the HMP code?
For example, a lot of the info commands produce lists of data,
you can imagine some of them could add x- types for each list entry.

Dave

>  User Defined Types
>  ~~~~~~~~~~~~~~~~~~
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


