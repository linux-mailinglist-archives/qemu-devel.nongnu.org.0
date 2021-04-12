Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3B35B9A9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:56:19 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVocU-0004Gp-U6
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVoYE-0007ov-US
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVoY9-0006BL-22
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618203107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrZ45x1F6WDPkVCBKsw+h2B05yaMjyHiV3BdO2i7jEk=;
 b=dCVdgW+tIjHk/GFJgjZNoHN0pAZeBcKD6nTvC2X4nxisJhFYRJLrRcEMD+wVEwOYx+Q6Tx
 h/4J5a9QHMOTxiEt4Nwf/imJubEus/CkRdUfzzJ4x9DQUCz1QN2ohrf9HhGhsek+eYzBDn
 OolNPysfSe8CgWM0vR+ZQigIAyQQlWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-NzAgFfnwNdO1xA8qYKD_vA-1; Mon, 12 Apr 2021 00:51:43 -0400
X-MC-Unique: NzAgFfnwNdO1xA8qYKD_vA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDAE18397A0;
 Mon, 12 Apr 2021 04:51:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C8BB10016FD;
 Mon, 12 Apr 2021 04:51:41 +0000 (UTC)
To: Chetan <chetan4windows@gmail.com>, qemu-devel@nongnu.org
References: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Better alternative to strncpy in QEMU.
Message-ID: <162f832d-ea91-a8f4-6f1d-56cda086f481@redhat.com>
Date: Mon, 12 Apr 2021 06:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/04/2021 15.50, Chetan wrote:
> Hello All,
> 
> This mail is in reference to one of the tasks mentioned in 
> '/Contribute/BiteSizedTasks/' in QEMU wiki, under '/API conversion/' which 
> states to introduce a better alternative to strncpy function.

Looks like this task has been added by Paolo, so I'm adding him to Cc: now.

( 
https://wiki.qemu.org/index.php?title=Contribute/BiteSizedTasks&diff=9130&oldid=9045 
)

> I've drafted 
> and tested below implementation for the same. Before proceeding with any 
> changes in QEMU code can you all please go through it and suggest 
> changes/corrections if required.
> 
> //* This function is introduced in place of strncpy(), it asserts if destination
>   * is large enough to fit strlen(source)+1 bytes and guarantees null 
> termination
>   * in destination string.
>   *
>   * char source[], is expecting a pointer to the source where data should be 
> copied
>   * from.
>   *
>   * char destination[], is expecting a pointer to the destination where data 
> should
>   * be copied to.
>   *
>   * size_t destination_size, is expecting size of destination.
>   * In case of char[], sizeof() function can be used to find the size.
>   * In case of char *, provide value which was passed to malloc() function for
>   * memory allocation.
>   */
> char *qemu_strncpy(char destination[], char source[], size_t destination_size)

Please use "*destination" and "*source" instead of "destination[]" and 
"source[]" here.

> {
>      /* Looping through the array and copying the characters from
>       * source to destination.
>       */
>      for (int i = 0; i < strlen(source); i++) {
>          destination[i] = source[i];
> 
>          /* Check if value of i is equal to the second last index
>           * of destination array and if condition is true, mark last
>           * index as NULL and break from the loop.
>           */
>          if (i == (destination_size - 2)) {
>              destination[destination_size - 1] = '\0';
>              break;
>          }
>      }
>      return destination;
> }

I think this is pretty much the same as g_strlcpy() from the glib:

https://developer.gnome.org/glib/2.66/glib-String-Utility-Functions.html#g-strlcpy

So I guess Paolo had something different in mind when adding this task?

> /* This function is introduced in place of strncpy(), it asserts if destination
>   * is large enough to fit strlen(source) bytes and does not guarantee null
>   * termination in destination string.
>   *
>   * char source[], is expecting a pointer to the source where data should be 
> copied
>   * from.
>   *
>   * char destination[], is expecting a pointer to the destination where data 
> should
>   * be copied to.
>   *
>   * size_t destination_size, is expecting size of destination.
>   * In case of char[], sizeof() function can be used to find the size.
>   * In case of char *, provide value which was passed to malloc() function for
>   * memory allocation.
>   */
> char *qemu_strncpy_nonul(char destination[], char source[], size_t 
> destination_size)
> {
>      /* Looping through the array and copying the characters from
>       * source to destination.
>       */
>      for (int i = 0; i < strlen(source); i++) {
>          destination[i] = source[i];
> 
>          /* Check if value of i is equal to the last index
>           * of the destination array and if condition is true,
>           * break from the loop.
>           */
>          if (i == (destination_size - 1)) {
>              break;
>          }
>      }
>      return destination;
> } /

I'm not sure what's the improvement over strncpy() here? Paolo, could you 
elaborate?
(Note that we also have some functions like strpadcpy() in QEMU already, 
which can be used in similar ways)

  Thomas


