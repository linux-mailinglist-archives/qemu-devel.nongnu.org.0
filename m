Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F29419F91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:54:54 +0200 (CEST)
Received: from localhost ([::1]:43132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwiD-0005Gj-KJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJf-00084G-SI
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJc-0000R2-PB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oF+RGKsZhfNWIBidPD5HBCWE2F/IddZxMCgrWOqOrkY=;
 b=Zxi7cvi+1WlNOuW7D0yADmGdmIbd0Z6zavkMvKRe/cb/Gb14/IU861UCtdFS1MsV34x7f9
 h+3vKiLWUaDwsq9Uup8l+S+MAXPfQOw68YtlOQlTmVWuBCwi3FbSMlEG3r8VJWZY2Bkywu
 ToHcWVs8HqKrXF3tY+4S8XI/52UYSmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-58Oc66asNbahPOPk9Prwbg-1; Mon, 27 Sep 2021 15:29:25 -0400
X-MC-Unique: 58Oc66asNbahPOPk9Prwbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9F2A19200C8;
 Mon, 27 Sep 2021 19:29:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F0BB60871;
 Mon, 27 Sep 2021 19:29:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/32] python/aqmp-tui: Add AQMP TUI
Date: Mon, 27 Sep 2021 15:25:10 -0400
Message-Id: <20210927192513.744199-30-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Added AQMP TUI.

Implements the follwing basic features:
1) Command transmission/reception.
2) Shows events asynchronously.
3) Shows server status in the bottom status bar.
4) Automatic retries on disconnects and error conditions.

Also added type annotations and necessary pylint/mypy configurations.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Message-Id: <20210823220746.28295-3-niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py | 620 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  13 +-
 2 files changed, 632 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
new file mode 100644
index 00000000000..ac533541d2f
--- /dev/null
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -0,0 +1,620 @@
+# Copyright (c) 2021
+#
+# Authors:
+#  Niteesh Babu G S <niteesh.gs@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+"""
+AQMP TUI
+
+AQMP TUI is an asynchronous interface built on top the of the AQMP library.
+It is the successor of QMP-shell and is bought-in as a replacement for it.
+
+Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
+Full Usage: aqmp-tui --help
+"""
+
+import argparse
+import asyncio
+import json
+import logging
+from logging import Handler, LogRecord
+import signal
+from typing import (
+    List,
+    Optional,
+    Tuple,
+    Type,
+    Union,
+    cast,
+)
+
+import urwid
+import urwid_readline
+
+from ..qmp import QEMUMonitorProtocol, QMPBadPortError
+from .error import ProtocolError
+from .message import DeserializationError, Message, UnexpectedTypeError
+from .protocol import ConnectError, Runstate
+from .qmp_client import ExecInterruptedError, QMPClient
+from .util import create_task, pretty_traceback
+
+
+# The name of the signal that is used to update the history list
+UPDATE_MSG: str = 'UPDATE_MSG'
+
+
+def format_json(msg: str) -> str:
+    """
+    Formats valid/invalid multi-line JSON message into a single-line message.
+
+    Formatting is first tried using the standard json module. If that fails
+    due to an decoding error then a simple string manipulation is done to
+    achieve a single line JSON string.
+
+    Converting into single line is more asthetically pleasing when looking
+    along with error messages.
+
+    Eg:
+    Input:
+          [ 1,
+            true,
+            3 ]
+    The above input is not a valid QMP message and produces the following error
+    "QMP message is not a JSON object."
+    When displaying this in TUI in multiline mode we get
+
+        [ 1,
+          true,
+          3 ]: QMP message is not a JSON object.
+
+    whereas in singleline mode we get the following
+
+        [1, true, 3]: QMP message is not a JSON object.
+
+    The single line mode is more asthetically pleasing.
+
+    :param msg:
+        The message to formatted into single line.
+
+    :return: Formatted singleline message.
+    """
+    try:
+        msg = json.loads(msg)
+        return str(json.dumps(msg))
+    except json.decoder.JSONDecodeError:
+        msg = msg.replace('\n', '')
+        words = msg.split(' ')
+        words = list(filter(None, words))
+        return ' '.join(words)
+
+
+def has_handler_type(logger: logging.Logger,
+                     handler_type: Type[Handler]) -> bool:
+    """
+    The Logger class has no interface to check if a certain type of handler is
+    installed or not. So we provide an interface to do so.
+
+    :param logger:
+        Logger object
+    :param handler_type:
+        The type of the handler to be checked.
+
+    :return: returns True if handler of type `handler_type`.
+    """
+    for handler in logger.handlers:
+        if isinstance(handler, handler_type):
+            return True
+    return False
+
+
+class App(QMPClient):
+    """
+    Implements the AQMP TUI.
+
+    Initializes the widgets and starts the urwid event loop.
+
+    :param address:
+        Address of the server to connect to.
+    :param num_retries:
+        The number of times to retry before stopping to reconnect.
+    :param retry_delay:
+        The delay(sec) before each retry
+    """
+    def __init__(self, address: Union[str, Tuple[str, int]], num_retries: int,
+                 retry_delay: Optional[int]) -> None:
+        urwid.register_signal(type(self), UPDATE_MSG)
+        self.window = Window(self)
+        self.address = address
+        self.aloop: Optional[asyncio.AbstractEventLoop] = None
+        self.num_retries = num_retries
+        self.retry_delay = retry_delay if retry_delay else 2
+        self.retry: bool = False
+        self.exiting: bool = False
+        super().__init__()
+
+    def add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        """
+        Appends the msg to the history list.
+
+        :param msg:
+            The raw message to be appended in string type.
+        """
+        urwid.emit_signal(self, UPDATE_MSG, msg, level)
+
+    def _cb_outbound(self, msg: Message) -> Message:
+        """
+        Callback: outbound message hook.
+
+        Appends the outgoing messages to the history box.
+
+        :param msg: raw outbound message.
+        :return: final outbound message.
+        """
+        str_msg = str(msg)
+
+        if not has_handler_type(logging.getLogger(), TUILogHandler):
+            logging.debug('Request: %s', str_msg)
+        self.add_to_history('<-- ' + str_msg)
+        return msg
+
+    def _cb_inbound(self, msg: Message) -> Message:
+        """
+        Callback: outbound message hook.
+
+        Appends the incoming messages to the history box.
+
+        :param msg: raw inbound message.
+        :return: final inbound message.
+        """
+        str_msg = str(msg)
+
+        if not has_handler_type(logging.getLogger(), TUILogHandler):
+            logging.debug('Request: %s', str_msg)
+        self.add_to_history('--> ' + str_msg)
+        return msg
+
+    async def _send_to_server(self, msg: Message) -> None:
+        """
+        This coroutine sends the message to the server.
+        The message has to be pre-validated.
+
+        :param msg:
+            Pre-validated message to be to sent to the server.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        try:
+            await self._raw(msg, assign_id='id' not in msg)
+        except ExecInterruptedError as err:
+            logging.info('Error server disconnected before reply %s', str(err))
+            self.add_to_history('Server disconnected before reply', 'ERROR')
+        except Exception as err:
+            logging.error('Exception from _send_to_server: %s', str(err))
+            raise err
+
+    def cb_send_to_server(self, raw_msg: str) -> None:
+        """
+        Validates and sends the message to the server.
+        The raw string message is first converted into a Message object
+        and is then sent to the server.
+
+        :param raw_msg:
+            The raw string message to be sent to the server.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        try:
+            msg = Message(bytes(raw_msg, encoding='utf-8'))
+            create_task(self._send_to_server(msg))
+        except (DeserializationError, UnexpectedTypeError) as err:
+            raw_msg = format_json(raw_msg)
+            logging.info('Invalid message: %s', err.error_message)
+            self.add_to_history(f'{raw_msg}: {err.error_message}', 'ERROR')
+
+    def unhandled_input(self, key: str) -> None:
+        """
+        Handle's keys which haven't been handled by the child widgets.
+
+        :param key:
+            Unhandled key
+        """
+        if key == 'esc':
+            self.kill_app()
+
+    def kill_app(self) -> None:
+        """
+        Initiates killing of app. A bridge between asynchronous and synchronous
+        code.
+        """
+        create_task(self._kill_app())
+
+    async def _kill_app(self) -> None:
+        """
+        This coroutine initiates the actual disconnect process and calls
+        urwid.ExitMainLoop() to kill the TUI.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        self.exiting = True
+        await self.disconnect()
+        logging.debug('Disconnect finished. Exiting app')
+        raise urwid.ExitMainLoop()
+
+    async def disconnect(self) -> None:
+        """
+        Overrides the disconnect method to handle the errors locally.
+        """
+        try:
+            await super().disconnect()
+        except (OSError, EOFError) as err:
+            logging.info('disconnect: %s', str(err))
+            self.retry = True
+        except ProtocolError as err:
+            logging.info('disconnect: %s', str(err))
+        except Exception as err:
+            logging.error('disconnect: Unhandled exception %s', str(err))
+            raise err
+
+    def _set_status(self, msg: str) -> None:
+        """
+        Sets the message as the status.
+
+        :param msg:
+            The message to be displayed in the status bar.
+        """
+        self.window.footer.set_text(msg)
+
+    def _get_formatted_address(self) -> str:
+        """
+        Returns a formatted version of the server's address.
+
+        :return: formatted address
+        """
+        if isinstance(self.address, tuple):
+            host, port = self.address
+            addr = f'{host}:{port}'
+        else:
+            addr = f'{self.address}'
+        return addr
+
+    async def _initiate_connection(self) -> Optional[ConnectError]:
+        """
+        Tries connecting to a server a number of times with a delay between
+        each try. If all retries failed then return the error faced during
+        the last retry.
+
+        :return: Error faced during last retry.
+        """
+        current_retries = 0
+        err = None
+
+        # initial try
+        await self.connect_server()
+        while self.retry and current_retries < self.num_retries:
+            logging.info('Connection Failed, retrying in %d', self.retry_delay)
+            status = f'[Retry #{current_retries} ({self.retry_delay}s)]'
+            self._set_status(status)
+
+            await asyncio.sleep(self.retry_delay)
+
+            err = await self.connect_server()
+            current_retries += 1
+        # If all retries failed report the last error
+        if err:
+            logging.info('All retries failed: %s', err)
+            return err
+        return None
+
+    async def manage_connection(self) -> None:
+        """
+        Manage the connection based on the current run state.
+
+        A reconnect is issued when the current state is IDLE and the number
+        of retries is not exhausted.
+        A disconnect is issued when the current state is DISCONNECTING.
+        """
+        while not self.exiting:
+            if self.runstate == Runstate.IDLE:
+                err = await self._initiate_connection()
+                # If retry is still true then, we have exhausted all our tries.
+                if err:
+                    self._set_status(f'[Error: {err.error_message}]')
+                else:
+                    addr = self._get_formatted_address()
+                    self._set_status(f'[Connected {addr}]')
+            elif self.runstate == Runstate.DISCONNECTING:
+                self._set_status('[Disconnected]')
+                await self.disconnect()
+                # check if a retry is needed
+                if self.runstate == Runstate.IDLE:
+                    continue
+            await self.runstate_changed()
+
+    async def connect_server(self) -> Optional[ConnectError]:
+        """
+        Initiates a connection to the server at address `self.address`
+        and in case of a failure, sets the status to the respective error.
+        """
+        try:
+            await self.connect(self.address)
+            self.retry = False
+        except ConnectError as err:
+            logging.info('connect_server: ConnectError %s', str(err))
+            self.retry = True
+            return err
+        return None
+
+    def run(self, debug: bool = False) -> None:
+        """
+        Starts the long running co-routines and the urwid event loop.
+
+        :param debug:
+            Enables/Disables asyncio event loop debugging
+        """
+        self.aloop = asyncio.get_event_loop()
+        self.aloop.set_debug(debug)
+
+        # Gracefully handle SIGTERM and SIGINT signals
+        cancel_signals = [signal.SIGTERM, signal.SIGINT]
+        for sig in cancel_signals:
+            self.aloop.add_signal_handler(sig, self.kill_app)
+
+        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
+        main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
+                                   unhandled_input=self.unhandled_input,
+                                   handle_mouse=True,
+                                   event_loop=event_loop)
+
+        create_task(self.manage_connection(), self.aloop)
+        try:
+            main_loop.run()
+        except Exception as err:
+            logging.error('%s\n%s\n', str(err), pretty_traceback())
+            raise err
+
+
+class StatusBar(urwid.Text):
+    """
+    A simple statusbar modelled using the Text widget. The status can be
+    set using the set_text function. All text set is aligned to right.
+
+    :param text: Initial text to be displayed. Default is empty str.
+    """
+    def __init__(self, text: str = ''):
+        super().__init__(text, align='right')
+
+
+class Editor(urwid_readline.ReadlineEdit):
+    """
+    A simple editor modelled using the urwid_readline.ReadlineEdit widget.
+    Mimcs GNU readline shortcuts and provides history support.
+
+    The readline shortcuts can be found below:
+    https://github.com/rr-/urwid_readline#features
+
+    Along with the readline features, this editor also has support for
+    history. Pressing the 'up'/'down' switches between the prev/next messages
+    available in the history.
+
+    Currently there is no support to save the history to a file. The history of
+    previous commands is lost on exit.
+
+    :param parent: Reference to the TUI object.
+    """
+    def __init__(self, parent: App) -> None:
+        super().__init__(caption='> ', multiline=True)
+        self.parent = parent
+        self.history: List[str] = []
+        self.last_index: int = -1
+        self.show_history: bool = False
+
+    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
+        """
+        Handles the keypress on this widget.
+
+        :param size:
+            The current size of the widget.
+        :param key:
+            The key to be handled.
+
+        :return: Unhandled key if any.
+        """
+        msg = self.get_edit_text()
+        if key == 'up' and not msg:
+            # Show the history when 'up arrow' is pressed with no input text.
+            # NOTE: The show_history logic is necessary because in 'multiline'
+            # mode (which we use) 'up arrow' is used to move between lines.
+            if not self.history:
+                return None
+            self.show_history = True
+            last_msg = self.history[self.last_index]
+            self.set_edit_text(last_msg)
+            self.edit_pos = len(last_msg)
+        elif key == 'up' and self.show_history:
+            self.last_index = max(self.last_index - 1, -len(self.history))
+            self.set_edit_text(self.history[self.last_index])
+            self.edit_pos = len(self.history[self.last_index])
+        elif key == 'down' and self.show_history:
+            if self.last_index == -1:
+                self.set_edit_text('')
+                self.show_history = False
+            else:
+                self.last_index += 1
+                self.set_edit_text(self.history[self.last_index])
+                self.edit_pos = len(self.history[self.last_index])
+        elif key == 'meta enter':
+            # When using multiline, enter inserts a new line into the editor
+            # send the input to the server on alt + enter
+            self.parent.cb_send_to_server(msg)
+            self.history.append(msg)
+            self.set_edit_text('')
+            self.last_index = -1
+            self.show_history = False
+        else:
+            self.show_history = False
+            self.last_index = -1
+            return cast(Optional[str], super().keypress(size, key))
+        return None
+
+
+class EditorWidget(urwid.Filler):
+    """
+    Wrapper around the editor widget.
+
+    The Editor is a flow widget and has to wrapped inside a box widget.
+    This class wraps the Editor inside filler widget.
+
+    :param parent: Reference to the TUI object.
+    """
+    def __init__(self, parent: App) -> None:
+        super().__init__(Editor(parent), valign='top')
+
+
+class HistoryBox(urwid.ListBox):
+    """
+    This widget is modelled using the ListBox widget, contains the list of
+    all messages both QMP messages and log messsages to be shown in the TUI.
+
+    The messages are urwid.Text widgets. On every append of a message, the
+    focus is shifted to the last appended message.
+
+    :param parent: Reference to the TUI object.
+    """
+    def __init__(self, parent: App) -> None:
+        self.parent = parent
+        self.history = urwid.SimpleFocusListWalker([])
+        super().__init__(self.history)
+
+    def add_to_history(self, history: str) -> None:
+        """
+        Appends a message to the list and set the focus to the last appended
+        message.
+
+        :param history:
+            The history item(message/event) to be appended to the list.
+        """
+        self.history.append(urwid.Text(history))
+        self.history.set_focus(len(self.history) - 1)
+
+    def mouse_event(self, size: Tuple[int, int], _event: str, button: float,
+                    _x: int, _y: int, focus: bool) -> None:
+        # Unfortunately there are no urwid constants that represent the mouse
+        # events.
+        if button == 4:  # Scroll up event
+            super().keypress(size, 'up')
+        elif button == 5:  # Scroll down event
+            super().keypress(size, 'down')
+
+
+class HistoryWindow(urwid.Frame):
+    """
+    This window composes the HistoryBox and EditorWidget in a horizontal split.
+    By default the first focus is given to the history box.
+
+    :param parent: Reference to the TUI object.
+    """
+    def __init__(self, parent: App) -> None:
+        self.parent = parent
+        self.editor_widget = EditorWidget(parent)
+        self.editor = urwid.LineBox(self.editor_widget)
+        self.history = HistoryBox(parent)
+        self.body = urwid.Pile([('weight', 80, self.history),
+                                ('weight', 20, self.editor)])
+        super().__init__(self.body)
+        urwid.connect_signal(self.parent, UPDATE_MSG, self.cb_add_to_history)
+
+    def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        """
+        Appends a message to the history box
+
+        :param msg:
+            The message to be appended to the history box.
+        """
+        if level:
+            msg = f'[{level}]: {msg}'
+        self.history.add_to_history(msg)
+
+
+class Window(urwid.Frame):
+    """
+    This window is the top most widget of the TUI and will contain other
+    windows. Each child of this widget is responsible for displaying a specific
+    functionality.
+
+    :param parent: Reference to the TUI object.
+    """
+    def __init__(self, parent: App) -> None:
+        self.parent = parent
+        footer = StatusBar()
+        body = HistoryWindow(parent)
+        super().__init__(body, footer=footer)
+
+
+class TUILogHandler(Handler):
+    """
+    This handler routes all the log messages to the TUI screen.
+    It is installed to the root logger to so that the log message from all
+    libraries begin used is routed to the screen.
+
+    :param tui: Reference to the TUI object.
+    """
+    def __init__(self, tui: App) -> None:
+        super().__init__()
+        self.tui = tui
+
+    def emit(self, record: LogRecord) -> None:
+        """
+        Emits a record to the TUI screen.
+
+        Appends the log message to the TUI screen
+        """
+        level = record.levelname
+        msg = record.getMessage()
+        self.tui.add_to_history(msg, level)
+
+
+def main() -> None:
+    """
+    Driver of the whole script, parses arguments, initialize the TUI and
+    the logger.
+    """
+    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser.add_argument('qmp_server', help='Address of the QMP server. '
+                        'Format <UNIX socket path | TCP addr:port>')
+    parser.add_argument('--num-retries', type=int, default=10,
+                        help='Number of times to reconnect before giving up.')
+    parser.add_argument('--retry-delay', type=int,
+                        help='Time(s) to wait before next retry. '
+                        'Default action is to wait 2s between each retry.')
+    parser.add_argument('--log-file', help='The Log file name')
+    parser.add_argument('--log-level', default='WARNING',
+                        help='Log level <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
+    parser.add_argument('--asyncio-debug', action='store_true',
+                        help='Enable debug mode for asyncio loop. '
+                        'Generates lot of output, makes TUI unusable when '
+                        'logs are logged in the TUI. '
+                        'Use only when logging to a file.')
+    args = parser.parse_args()
+
+    try:
+        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
+    except QMPBadPortError as err:
+        parser.error(str(err))
+
+    app = App(address, args.num_retries, args.retry_delay)
+
+    root_logger = logging.getLogger()
+    root_logger.setLevel(logging.getLevelName(args.log_level))
+
+    if args.log_file:
+        root_logger.addHandler(logging.FileHandler(args.log_file))
+    else:
+        root_logger.addHandler(TUILogHandler(app))
+
+    app.run(args.asyncio_debug)
+
+
+if __name__ == '__main__':
+    main()
diff --git a/python/setup.cfg b/python/setup.cfg
index efcda23c48d..9bc25998c12 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -81,8 +81,19 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
+[mypy-qemu.aqmp.aqmp_tui]
+# urwid and urwid_readline have no type stubs:
+allow_subclassing_any = True
+
+# The following missing import directives are because these libraries do not
+# provide type stubs. Allow them on an as-needed basis for mypy.
 [mypy-fuse]
-# fusepy has no type stubs:
+ignore_missing_imports = True
+
+[mypy-urwid]
+ignore_missing_imports = True
+
+[mypy-urwid_readline]
 ignore_missing_imports = True
 
 [pylint.messages control]
-- 
2.31.1


